{ pkgs, ... }:

let
  brunchGrub = pkgs.runCommand "brunch-grub-efi" {
    nativeBuildInputs = [ pkgs.grub2_efi ];
  } ''
    mkdir -p "$out/EFI/Brunch"

    grub-mkstandalone \
      --format=x86_64-efi \
      --output="$out/EFI/Brunch/grubx64.efi" \
      --modules="part_gpt part_msdos btrfs ext2 fat loopback search search_fs_file linux normal" \
      "boot/grub/grub.cfg=${./brunch-grub.cfg}"
  '';
in
{
  boot.loader.systemd-boot = {
    extraFiles = {
      "EFI/Brunch/grubx64.efi" =
        "${brunchGrub}/EFI/Brunch/grubx64.efi";
    };

    extraEntries = {
      "brunch.conf" = ''
        title Brunch (ChromeOS)
        efi /EFI/Brunch/grubx64.efi
      '';
    };
  };
}
