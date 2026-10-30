{ ... }:

{
  imports = [
    # My desktop setup and configs
    ./umbriel.nix
    ./noctalia.nix

    # Terminal and shell configuration
    ./terminal.nix

    # Setup some user dirs and Wallpapers
    ./user-dirs.nix
  ];
}
