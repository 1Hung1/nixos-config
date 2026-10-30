{ pkgs, ... }:

{
  home.stateVersion = "26.11"; # Match the nixpkgs version

  # User-specific packages go here
  home.packages = with pkgs; [
    fastfetch
    nerd-fonts.jetbrains-mono
    adw-gtk3
  ];

  # Import settings and configs
  imports = [ ./configs ];

  # Let Home Manager manage itself when changes are applied
  programs.home-manager.enable = true;
}
