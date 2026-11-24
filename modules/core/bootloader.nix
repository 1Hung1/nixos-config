{
  flake.modules.nixos.bootloader = {
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
      timeout = 0;
    };
    services.bootvine.enable = true;
  };
}
