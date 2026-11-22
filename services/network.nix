{ lib, ... }:

{
  # Enable networking
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings.General.EnableNetworkConfiguration = false;
  networking.firewall.enable = lib.mkDefault true;
  networking.hostName = lib.mkDefault "normal"; # Change if you need to

  # DNS configuration
  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = [
        "1.1.1.1"
        "2606:4700:4700::1111"
      ];
      FallbackDNS = [
        "1.0.0.1"
        "2606:4700:4700::1001"
      ];
      Domains = [ "~." ];
    };
  };
}
