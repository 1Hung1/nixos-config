{ pkgs, ... }:

{
  # Set the max charge threshold to help battery aging
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
