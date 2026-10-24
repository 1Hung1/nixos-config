{ pkgs, ... }:

{
  home.stateVersion = "26.11"; # Match your nixpkgs version

  # User-specific packages installed just for you
  home.packages = with pkgs; [
    google-chrome
    fastfetch
    alacritty
    qt6Packages.qt6ct
    vesktop
    nerd-fonts.jetbrains-mono
    nil
  ];

  # Import my settings and configs
  imports = [
    ./homemanager
  ];

  # Let Home Manager manage itself when changes are applied
  programs.home-manager.enable = true;
}
