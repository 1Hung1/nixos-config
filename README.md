# nixos-config
My normal NixOS config (for my laptop)

> [!WARNING]
> This is my laptop config, fully Ctrl+C'ed and mirrored to my laptop. Use the main branch if you want to continue using my config. If you want to contiune, continue on your own risk as a lot of thing might break

Installation:
- Copy all files in etc/nixos to your system's /etc/nixos
- Then copy Pictures to your home (~). Needed for wallpapers
- Add nixpkgs: sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
- Update nixpkgs: sudo nix-channel --update
- Run: sudo nix --extra-experimental-features "nix-command"  run nixpkgs#nixos-facter | sudo tee /etc/nixos/facter.json
- Rebuild your system: sudo nixos-rebuild --flake /etc/nixos#nixos-btw
