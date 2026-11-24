{
  flake.modules.nixos.solstice = {
    boot.initrd.luks.devices."cryptroot" = {
      device = "/dev/disk/by-uuid/aec0d40b-3d60-4e02-a8e7-1ff22e110ec3";
      crypttabExtraOpts = [
        "tpm2-device=auto"
      ];
    };
  };
}
