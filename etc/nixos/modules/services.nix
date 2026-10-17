{ pkgs, ... }:

{
  # Disable some unneeded stuff and enable some needed stuff
  services.displayManager.ly.enable = true;
  services.printing.enable = false;
  services.libinput.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.openssh.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    # jack.enable = true;
  };
  security.rtkit.enable = true;
}
