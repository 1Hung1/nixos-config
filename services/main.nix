{ pkgs, ... }:

{
  # Disable some unneeded stuff and enable some needed stuff
  services.displayManager.ly.enable = true;
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.openssh.enable = true;
  services.fprintd.enable = false;
  services.printing.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # Little fix since the X11 bell crashes pipewire for some reason lol
    extraConfig.pipewire."10-disable-x11-bell" = {
      "context.properties" = {
        "module.x11.bell" = false;
      };
    };
  };
  security.rtkit.enable = true;
}
