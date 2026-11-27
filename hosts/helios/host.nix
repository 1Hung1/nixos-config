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
    common
    helios
    hosts-protonvpn
    hosts-openssh
    hosts-secrets
    hosts-tempfiles
    hung-password
    {
      home-manager.users.hung.imports = with config.flake.modules.homeManager; [
        helios
        hosts-git
      ];
    }
  ];
in
{
  flake.nixosConfigurations.helios = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";

    specialArgs = {
      inherit inputs;
    };

    modules = baseModules ++ hostModules;
  };
}
