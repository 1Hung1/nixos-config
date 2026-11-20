{ inputs, pkgs, lib, ... }:

{
  home.stateVersion = "26.11";

  # User-specific packages go here
  home.packages = with pkgs; [
    fastfetch
    nerd-fonts.jetbrains-mono
    adw-gtk3
  ];
  imports = [ (inputs.import-tree.initFilter (lib.hasSuffix ".nix") ./_configs) ];

  # Let Home Manager manage itself when changes are applied
  programs.home-manager.enable = true;
}
