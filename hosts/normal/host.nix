{
  config,
  inputs,
  lib,
  ...
}:

let
  hardware = ./hardware/hardware-configuration.nix;
in
lib.optionalAttrs (builtins.pathExists hardware) {
  # The generic host only exists once its hardware config has been generated.
  flake.nixosConfigurations.normal = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = [
      inputs.home-manager.nixosModules.home-manager
      inputs.agenix.nixosModules.default
      inputs.chaotic-nyx.nixosModules.default
      {
        system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
      }
      config.flake.modules.nixos.common
      config.flake.modules.nixos.normal
    ];
  };
}
