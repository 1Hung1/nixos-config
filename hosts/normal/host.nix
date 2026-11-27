{
  config,
  inputs,
  lib,
  ...
}:
let
  baseModules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.agenix.nixosModules.default
    inputs.chaotic-nyx.nixosModules.default
    {
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    }
  ];
  hostModules = with config.flake.modules.nixos; [
    common
    normal
    {
      home-manager.users.hung.imports = with config.flake.modules.homeManager; [
        normal
      ];
    }
  ];
  hardware = ./hardware/hardware-configuration.nix;
in
lib.optionalAttrs (builtins.pathExists hardware) {
  # The generic host only exists once its hardware config has been generated.
  flake.nixosConfigurations.helios = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = baseModules ++ hostModules;
  };
}
