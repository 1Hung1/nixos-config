{ ... }:

{
  imports = [
    ./users.nix
    ./boot.nix
    ./services.nix
    ./network.nix
    # ./opentabletdriver.nix # Uncomment if needed
    # ./wacom-setup.nix # Uncomment if needed
    ./nix-flatpak.nix # Uncomment if needed
  ];
}
