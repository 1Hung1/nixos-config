{
  flake.modules.nixos.services-noc-greeter =
    { inputs, pkgs, ... }:
    {
      imports = [ inputs.noc-greeter.nixosModules.default ];
      services.displayManager.noctalia-greeter = {
        enable = true;
        settings = {
          cursor = {
            theme = "Bibata-Modern-Classic";
            size = 20;
            path = pkgs.bibata-cursors;
          };
        };
      };
    };
}
