{
  description = "1Hung1's nixos config";

  outputs =
    args@{ self, ... }:
    let
      inputs = (import ./.tack) { overrides = args.tackOverrides or { }; };
    in
    inputs.flake-parts.lib.mkFlake { inputs = args // inputs; } {
      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree ./modules)
        (inputs.import-tree ./hosts)
      ];
    };
}
