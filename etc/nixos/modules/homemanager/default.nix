{ ... }:

{
  imports = [
    # My desktop setup and configs
  	./hung-umbriel.nix
  	./hung-noctalia.nix

  	# Terminal, git and shell configuration
  	./hung-terminal.nix
  	./hung-git.nix

  	# GUI theming configuration
    ./hung-qt6ct.nix

    # Extra stuff (uncomment if unneeded)
    ./hung-areofyl-fetch.nix
    # ./hung-obs-studio.nix
  ];
}
