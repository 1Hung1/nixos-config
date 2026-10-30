{ lib, ... }:

{
  # Enable networking
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings.General.EnableNetworkConfiguration = false; # Makes it so that
  networking.firewall.enable = lib.mkDefault true;
  networking.hostName = lib.mkDefault "nixos-btw"; # Change if you need to
  services.resolved.enable = true;
  systemd.network.networks."50-wifi" = {
    matchConfig.Name = "wl*";
    networkConfig.DHCP = "yes";
  };
  systemd.network.networks."50-ethernet" = {
    matchConfig.name = "enp*";
    networkConfig.DHCP = "yes";
  };
}
