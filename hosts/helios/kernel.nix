{
  flake.modules.nixos.helios =
    { lib, pkgs, ... }:
    {
      # Force the normal NixOS kernel (helios doesn't support x86-64-v3 which the cachyos kernel uses)
      boot.kernelPackages = lib.mkForce pkgs.linuxPackages_latest;
    };
}
