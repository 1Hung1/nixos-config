{
  flake.modules.nixos.programs-desktop =
    { inputs, ... }:
    {
      # Import needed stuff
      imports = [
        inputs.umbriel.nixosModules.default
        inputs.noctalia.nixosModules.default
      ];

      # Enable umbriel and noctalia
      programs.noctalia.enable = true;
      programs.umbriel.enable = true;

      # Enable oo7-daemon for a keyring daemon
      services.oo7.enable = true;
      security.pam.services.ly.oo7.enable = true;
    };
}
