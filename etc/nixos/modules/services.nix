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
  };
  security.rtkit.enable = true;

  systemd.services.battery-charge-threshold = {
    description = "Set battery charge thresholds";
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      ExecStart = pkgs.writeShellScript "battery-charge-threshold" ''
        set -eu
        for bat in /sys/class/power_supply/BAT*; do
          [ -e "$bat/charge_control_end_threshold" ] || continue
          echo 80 > "$bat/charge_control_end_threshold"
        done
      '';
    };
  };
}
