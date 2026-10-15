# nixos-config
My normal NixOS config (for my laptop)

Installation:
- Copy all files in etc/nixos to your system's /etc/nixos
- Then copy Pictures to your home (~). Needed for wallpapers
- Add nixpkgs: sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
- Update nixpkgs: sudo nix-channel --update
- Run: sudo nix --extra-experimental-features "nix-command"  run nixpkgs#nixos-facter | sudo tee /etc/nixos/facter.json
- Rebuild your system: sudo nixos-rebuild --flake /etc/nixos#nixos-btw
