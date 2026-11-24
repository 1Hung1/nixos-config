{
  config,
  inputs,
  ...
}:

{
  flake.nixosConfigurations.helios = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.agenix.nixosModules.default
      inputs.chaotic.nixosModules.default
      {
        system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
      }
      config.flake.modules.nixos.common
      config.flake.modules.nixos.helios
      {
        home-manager.users.hung.imports = [ config.flake.modules.homeManager.helios ];
      }
    ];
  };
}
