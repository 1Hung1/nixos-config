{ pkgs, ... }:

{
  # Enable OpenTabletDriver and its daemon
  hardware.opentabletdriver.enable = true;
  hardware.opentabletdriver.daemon.enable = true;

  # Ensure kernel uinput module is enabled
  hardware.uinput.enable = true;
  boot.kernelModules = [ "uinput" "kvm-intel" ];

  # Make sure the GUI package is installed so you can configure the tablet
  environment.systemPackages = with pkgs; [
    opentabletdriver
  ];
}
