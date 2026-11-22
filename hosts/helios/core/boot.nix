{ lib, pkgs, ... }:

{
  boot = {
    # Kernel configuration
    kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    # Add intel iGPU settings to the current cmdline
    kernelParams = [
      "i915.enable_psr=1"
      "i915.enable_fbc=1"
      "i915.enable_dc=2"
    ];

    # Set no timeout
    loader.timeout = 0;

    # LVM setup
    initrd.services.lvm.enable = true;
  };
}
