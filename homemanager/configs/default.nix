{ ... }:

{
  imports = [
    # My desktop setup and configs
    ./umbriel.nix
    ./noctalia.nix

    # Terminal, git and shell configuration
    ./terminal.nix
  ];
}
