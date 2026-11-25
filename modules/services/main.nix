{
  flake.modules.nixos.services-main = {
    # Enable ly: A login manager
    services.displayManager.ly.enable = true;

    # Enable power management daemons
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    # Disable stuff i don't use
    services.fprintd.enable = false;
    services.printing.enable = false;

    # Other stuff
    services.speechd.enable = false;
    services.flatpak.enable = true;
  };
}
