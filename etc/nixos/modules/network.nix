{ ... }:

{
  # Enable networking
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.wireless.iwd.enable = true;
  networking.hostName = "nixos-btw";
  services.resolved.enable = true;
  systemd.network.networks."50-wifi" = {
    matchConfig.Name = "wl*";
    networkConfig.DHCP = "yes";
  };
}
