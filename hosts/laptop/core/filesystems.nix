{
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a9663dde-939c-48ce-81d3-726311bf3d23";
    fsType = "btrfs";
    options = [ "noatime" "ssd" "compress=zstd:3" "space_cache=v2" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/a9663dde-939c-48ce-81d3-726311bf3d23";
    fsType = "btrfs";
    options = [ "subvol=nix" "noatime" "ssd" "compress=zstd:3" "space_cache=v2" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/a9663dde-939c-48ce-81d3-726311bf3d23";
    fsType = "btrfs";
    options = [ "subvol=home" "noatime" "ssd" "compress=zstd:3" "space_cache=v2" ];
  };

  fileSystems."/boot" = { device = "/dev/disk/by-uuid/8293-2032"; fsType = "vfat"; };
}

