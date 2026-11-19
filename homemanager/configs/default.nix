{ ... }:

{
  imports = [
    # My desktop setup and configs
    ./umbriel.nix
    ./noctalia.nix

    # Terminal and shell configuration
    ./terminal.nix

    # Other stuff
    ./user-dirs.nix
    ./cursor.nix
  ];
}
