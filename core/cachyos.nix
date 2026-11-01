{ inputs, pkgs, ... }:

{
  # Setup CachyOS settings
  imports = [
    inputs.cachyos-settings-nix.nixosModules.default
  ];

  # Enable CachyOS settings
  cachyos.settings = {
    enable = true;
    sysctl.enable = true;
    ioSchedulers.enable = true;
    audio.enable = true;
    serviceManager.enable = true;
    oomd.enable = true;
    coredump.enable = true;
    thp.enable = true;
    storage.enable = true;
    journal.enable = true;
    watchdogBlacklist.enable = true;
  };

  # CachyOS kernel configuration
  nixpkgs.overlays = [
    nix-cachyos-kernel.overlays.pinned
  ];

  boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  # Enable the binary caches
  nix.settings.extra-substituters = [ "https://cache.lantian.pub/lantian" ];
  nix.settings.extra-trusted-public-keys = [ "lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ=" ];
}
