{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    umbriel.url = "github:noctalia-dev/umbriel/cachix";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    qtengine = { url = "github:kossLAN/qtengine"; inputs.nixpkgs.follows = "nixpkgs"; };
    cachyos-settings = { url = "github:Daaboulex/cachyos-settings-nix"; inputs.nixpkgs.follows = "nixpkgs"; };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };
  outputs =
    { self, nixpkgs, home-manager, ... }@inputs:
    {
      nixosConfigurations = {
        normal = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./.
            home-manager.nixosModules.home-manager
          ];
        };
        solstice = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./.
            ./hosts/solstice
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
