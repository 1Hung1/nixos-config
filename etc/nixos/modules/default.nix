{ ... }:

{
  imports = [
    ./users.nix
    ./boot.nix
    ./services.nix
    ./network.nix
    ./nix-ld.nix
  ];
}
