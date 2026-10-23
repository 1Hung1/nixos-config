{ inputs, pkgs, ... }:

{
  # Define a user account, change username if needed and set a password
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
    backupCommand = pkgs.writeShellScript "hm-backup" ''
      set -eu

      target="$1"
      timestamp="$(date +%Y%m%d-%H%M%S-%N)"
      backup="''${target}.backup-''${timestamp}"

      mv -- "$target" "$backup"
    '';
    users.hung = import ./hung-homemanager.nix;
  };
}
