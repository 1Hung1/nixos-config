{ ... }:

{
  imports = [
    # My desktop setup and configs
    ./umbriel.nix
    ./noctalia.nix

    # Terminal and shell configuration
    ./terminal.nix

    # Setup user dirs and wallpapers
    ./user-dirs.nix
  ];
}
