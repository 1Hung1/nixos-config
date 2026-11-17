{ pkgs, ... }:

{
  # Enable Plasma 
  services = {
    desktopManager.plasma6.enable = true;
    xserver.enable = true;
  };
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    konsole
    elisa
  ];
  services.orca.enable = false;
}
