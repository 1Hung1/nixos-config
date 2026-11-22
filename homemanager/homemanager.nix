{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  home.stateVersion = "26.11";

  # Import home manager configs
  imports = [ (inputs.import-tree.initFilter (lib.hasSuffix ".nix") ./_configs) ];

  # Let Home Manager manage itself when changes are applied
  programs.home-manager.enable = true;
}
