{
  fileSystems."/" = {
    device = "/dev/mapper/nixos-root";
    fsType = "btrfs";
    options = [
      "noatime"
      "ssd"
      "compress=zstd:3"
      "space_cache=v2"
    ];
  };

  fileSystems."/nix" = {
    device = "/dev/mapper/nixos-root";
    fsType = "btrfs";
    options = [
      "subvol=nix"
      "noatime"
      "ssd"
      "compress=zstd:3"
      "space_cache=v2"
    ];
  };

  fileSystems."/home" = {
    device = "/dev/mapper/nixos-root";
    fsType = "btrfs";
    options = [
      "subvol=home"
      "noatime"
      "ssd"
      "compress=zstd:3"
      "space_cache=v2"
    ];
  };

  fileSystems."/boot" = {
    device = "/dev/sda1";
    fsType = "vfat";
  };
}
