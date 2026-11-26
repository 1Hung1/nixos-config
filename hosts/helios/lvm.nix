{
  flake.modules.nixos.helios = {
    boot.initrd.kernelModules = [
      "dm_mod"
    ];
  };
}
