{
  config,
  inputs,
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
    # Import normal/common modules
    common

    # Import host-specific modules
    solstice
    hosts-protonvpn
    hosts-openssh
    hosts-secrets
    hosts-tempfiles
    hosts-secureboot
    hung-password

    # Import host-specfic Home Manager modules
    {
      home-manager.users.hung.imports = with config.flake.modules.homeManager; [
        solstice
        hosts-git
      ];
    }
  ];
in
{
  flake.nixosConfigurations.solstice = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = baseModules ++ hostModules;
  };
}
