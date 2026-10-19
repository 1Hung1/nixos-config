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

  systemd.services.battery-charge-threshold = {
    description = "Set ASUS battery charge thresholds";
    wantedBy = [ "multi-user.target" ];
    after = [ "systemd-udev-settle.service" ];
  
    serviceConfig = {
      Type = "oneshot";
      ExecStart = pkgs.writeShellScript "battery-charge-threshold" ''
        set -eu
        echo 80 > /sys/class/power_supply/BAT0/charge_control_end_threshold
      '';
    };
  };
}
