{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    umbriel.url = "github:noctalia-dev/umbriel/cachix";
    noctalia.url = "github:noctalia-dev/noctalia/cachix";
    qtengine = {
      url = "github:kossLAN/qtengine";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    cachyos-settings = {
      url = "github:Daaboulex/cachyos-settings-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.2.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    import-tree.url = "git+https://github.com/denful/import-tree?ref=main";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      import-tree,
      ...
    }@inputs:
    let
      mkHost =
        host:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
          };

          modules = [
            (import-tree [
              ./core
              ./services
              ./programs
              ./users
            ])
            home-manager.nixosModules.home-manager
            {
              system.configurationRevision = self.rev or self.dirtyRev or null;
            }
            (import-tree host)
          ];
        };
    in
    {
      nixosConfigurations = {
        solstice = mkHost ./hosts/solstice;
        helios = mkHost ./hosts/helios;
      }
      // nixpkgs.lib.optionalAttrs (builtins.pathExists ./hosts/normal) {
        # The generic host only exists once its hardware config has been generated.
        normal = mkHost ./hosts/normal;
      };
    };
}
