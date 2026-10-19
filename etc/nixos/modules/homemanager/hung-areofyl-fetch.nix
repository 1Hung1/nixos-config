{ inputs, pkgs, ... }: 

{
  imports = [
    inputs.areofyl-fetch.homeManagerModules.default
  ];

  # You must enable the program for the flake to actually install it!
  programs.fetch = {
    enable = true;
  };
}
