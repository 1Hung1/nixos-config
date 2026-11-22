{
  fileSystems = {
    "/" = {
      device = "/dev/mapper/linux-root";
      fsType = "btrfs";
      options = [
        "noatime"
        "ssd"
        "compress=zstd:3"
        "space_cache=v2"
      ];
    };
    "/nix" = {
      device = "/dev/mapper/linux-root";
      fsType = "btrfs";
      options = [
        "subvol=nix"
        "noatime"
        "ssd"
        "compress=zstd:3"
        "space_cache=v2"
      ];
    };
    "/home" = {
      device = "/dev/mapper/linux-root";
      fsType = "btrfs";
      options = [
        "subvol=home"
        "noatime"
        "ssd"
        "compress=zstd:3"
        "space_cache=v2"
      ];
    };
    "/boot" = {
      device = "/dev/nvme0n1p1";
      fsType = "vfat";
    };
  };
}
