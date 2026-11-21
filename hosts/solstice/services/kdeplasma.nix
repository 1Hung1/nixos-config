{ pkgs, lib, ... }:

{
  services = {
    desktopManager.plasma6.enable = true;
    speechd.enable = lib.mkForce false;
    # Enable X11 support
    xserver.enable = true;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
  ];
}
