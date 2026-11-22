{
  boot = {
    # Add intel iGPU settings to the current cmdline
    kernelParams = [
      "i915.enable_psr=1"
      "i915.enable_fbc=1"
      "i915.enable_dc=2"
    ];

    # Set no timeout
    loader.timeout = 0;

    # LUKS setup
    initrd.luks.devices."cryptroot" = {
      device = "/dev/disk/by-uuid/aec0d40b-3d60-4e02-a8e7-1ff22e110ec3";
      crypttabExtraOpts = [
        "tpm2-device=auto"
      ];
    };
  };
}
