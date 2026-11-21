{ lib, inputs, pkgs, ... }:

{
  # Import lanzaboote module
  imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

  # Install sbctl
  environment.systemPackages = with pkgs; [
    sbctl
  ];

  # Disable systemd-boot (lanzaboote replaces systemd-boot)
  boot.loader.systemd-boot.enable = lib.mkForce false;

  # Setup lanzaboote
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/var/lib/sbctl";
  };
}
