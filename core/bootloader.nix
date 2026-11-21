{ lib, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 4;
      consoleMode = "max";
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    timeout = lib.mkDefault 2;
  };
  services.bootvine.enable = true;
}
