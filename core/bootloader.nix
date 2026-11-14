{ lib, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
      consoleMode = "max";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    timeout = lib.mkDefault 5;
  };
}
