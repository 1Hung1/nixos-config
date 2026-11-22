{ inputs, pkgs, ... }:

{
  # Import CachyOS settings
  imports = [ inputs.cachyos-settings.nixosModules.default ];

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

  # Enable the binary caches
  nix.settings.extra-substituters = [ "https://cache.lantian.pub/lantian" ];
  nix.settings.extra-trusted-public-keys = [ "lantian:WVGO7vsRMSEN+h7Lp7kv6SAmrkEXgUGbbXm7jMDjBuQ=" ];
}
