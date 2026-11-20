{ config, pkgs, ... }:

let
  vpnToggle = pkgs.writeShellScriptBin "vpn" ''
    case "$1" in
      up|on)
        sudo networkctl up wg0 && echo "Proton VPN: ON"
        ;;
      down|off)
        sudo networkctl down wg0 && echo "Proton VPN: OFF"
        ;;
      status)
        networkctl status wg0
        ;;
      *)
        # Toggle automatically if no argument is passed
        if ip link show wg0 | grep -q "UP"; then
          sudo networkctl down wg0 && echo "Proton VPN: OFF"
        else
          sudo networkctl up wg0 && echo "Proton VPN: ON"
        fi
        ;;
    esac
  '';
in
{
  # Enable WireGuard kernel module
  networking.wireguard.enable = true;

  # Install VPN pacakge
  environment.systemPackages = [ vpnToggle ];

  systemd.network.netdevs = {
    "10-wg0" = {
      netdevConfig = {
        Kind = "wireguard";
        Name = "wg0";
      };
      wireguardConfig = {
        PrivateKeyFile = "/etc/wireguard/privatekey";
        FirewallMark = 51820;
      };
      wireguardPeers = [{
        PublicKey = "rgPoLtUhJ946CVYPkp8r3VL8KHUYSmTIrPo7Wsw9sn4=";
        Endpoint = "151.243.141.165:51820";
        AllowedIPs = [ "0.0.0.0/0" ];
        PersistentKeepalive = 25;
      }];
    };
  };

  systemd.network.networks = {
    "10-wg0" = {
      matchConfig.Name = "wg0";
      address = [ "10.2.0.2/32" ];
      routes = [{
        Destination = "0.0.0.0/0";
        Table = 51820;
      }];
      routingPolicyRules = [{
        FirewallMark = 51820;
        InvertRule = true;
        Table = 51820;
        Priority = 100;
      }];
      networkConfig = {
        DNS = [ "10.2.0.1" ];
        DNSDefaultRoute = true;
      };
      linkConfig = {
        ActivationPolicy = "manual";
      };
    };
  };
}
