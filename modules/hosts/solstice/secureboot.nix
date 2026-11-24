{
  flake.modules.nixos.solstice = { lib, inputs, pkgs, ... }:
    {
      # Import lanzaboote module
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

      # Install sbctl
      environment.systemPackages = with pkgs; [
        sbctl
      ];

      # Disable systemd-boot (lanzaboote replaces it)
      boot.loader.systemd-boot.enable = lib.mkForce false;

      # Setup lanzaboote
      boot.lanzaboote = {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
        configurationLimit = 4;

        # Setup auto generation and auto enroll for keys
        autoEnrollKeys = {
          enable = true;
          includeFirmwareBuiltinKeys = true;
          autoReboot = true;
        };
        autoGenerateKeys.enable = true;

        # Setup measured boot
        measuredBoot = {
          enable = true;
          pcrs = [
            0
            7
          ];
          autoCryptenroll = {
            enable = true;
            device = "/dev/disk/by-uuid/aec0d40b-3d60-4e02-a8e7-1ff22e110ec3";
          };
        };
      };
    };
}
