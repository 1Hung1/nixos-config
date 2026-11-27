{
  flake.modules.nixos.tack =
    { inputs, ... }:
    {
      disabledModules = [ "programs/tack.nix" ];
      imports = [ inputs.tack.nixosModules.default ];
      programs.tack.enable = true;
    };
}
