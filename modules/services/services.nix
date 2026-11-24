{
  flake.modules.nixos.services = {
    # Enable ly: A login manager
    services.displayManager.ly.enable = true;

    # Enable power management daemons
    services.power-profiles-daemon.enable = true;
    services.upower.enable = true;

    # Disable stuff i don't use
    services.fprintd.enable = false;
    services.printing.enable = false;

    # Enable some audio related stuff
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    security.rtkit.enable = true;

    # Other stuff
    services.speechd.enable = false;
    services.flatpak.enable = true;
  };
}
