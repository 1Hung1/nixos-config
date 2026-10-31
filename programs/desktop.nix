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
}
