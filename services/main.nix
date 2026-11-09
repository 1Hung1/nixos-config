{ pkgs, ... }:

{
  # Disable some unneeded stuff and enable some needed stuff
  services.displayManager.ly.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.fprintd.enable = false;
  services.printing.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;
}
