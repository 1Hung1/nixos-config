{
  config,
  inputs,
  ...
}:
let
  baseModules = [
    inputs.home-manager.nixosModules.home-manager
    inputs.agenix.nixosModules.default
    inputs.chaotic.nixosModules.default
    {
      system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
    }
  ];
  hostModules = with config.flake.modules.nixos; [
    common
    solstice
    secrets
    services-protonvpn
    services-openssh
    services-tempfiles
    hung-password
    {
      home-manager.users.hung.imports = with config.flake.modules.homeManager; [
        solstice
        programs-git
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
