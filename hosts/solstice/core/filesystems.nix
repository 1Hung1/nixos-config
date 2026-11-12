{
  fileSystems."/" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "noatime" "ssd" "compress=zstd:3" "space_cache=v2" ];
  };

  fileSystems."/nix" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "subvol=nix" "noatime" "ssd" "compress=zstd:3" "space_cache=v2" ];
  };

  fileSystems."/home" = {
    device = "/dev/nvme0n1p2";
    fsType = "btrfs";
    options = [ "subvol=home" "noatime" "ssd" "compress=zstd:3" "space_cache=v2" ];
  };

  fileSystems."/boot" = { device = "/dev/nvme0n1p1"; fsType = "vfat"; };
}

