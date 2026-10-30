{
  inputs = {
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
    umbriel.url = "github:noctalia-dev/umbriel/cachix";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    qtengine = { url = "github:kossLAN/qtengine"; inputs.nixpkgs.follows = "nixpkgs"; };
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
            {
              system.configurationRevision =
                self.rev or self.dirtyRev or null;
            }
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./.
            ./hosts/solstice
            home-manager.nixosModules.home-manager
            {
              system.configurationRevision =
                self.rev or self.dirtyRev or null;
            }
          ];
        };
      };
    };
}
