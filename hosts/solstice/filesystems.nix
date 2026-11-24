{
  flake.modules.nixos.solstice = {
    fileSystems = {
      "/" = {
        device = "/dev/mapper/linux-root";
        fsType = "btrfs";
        options = [
          "noatime"
          "compress=zstd:3"
        ];
      };
      "/nix" = {
        device = "/dev/mapper/linux-root";
        fsType = "btrfs";
        options = [
          "subvol=nix"
          "noatime"
          "compress=zstd:3"
        ];
      };
      "/home" = {
        device = "/dev/mapper/linux-root";
        fsType = "btrfs";
        options = [
          "subvol=home"
          "noatime"
          "compress=zstd:3"
        ];
      };
      "/boot" = {
        device = "/dev/nvme0n1p1";
        fsType = "vfat";
      };
    };
  };
}
