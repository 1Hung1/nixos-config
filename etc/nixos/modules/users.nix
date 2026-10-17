{ inputs, pkgs, ... }:

{
  # Define a user account
  users.users."hung" = {
    isNormalUser = true;
    description = "Hung";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.hung = import ./hung-homemanager.nix;
  };
}
