{ inputs, pkgs, ... }: 

{
  # Import the nix-flatpak NixOS module
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "sh.ppy.osu"
      "org.vinegarhq.Sober"
    ];
  };
}
