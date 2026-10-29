{ inputs, pkgs, ... }:

{
  # Define a user account (change username if needed)
  users.users."hung" = {
    isNormalUser = true;
    extraGroups = [ "wheel" "render" "video" "audio" ];
    shell = pkgs.zsh;
    # Make sure to run passwd to set a password for the account
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    backupCommand = pkgs.writeShellScript "hm-backup" ''
      set -eu

      target="$1"
      timestamp="$(date +%Y%m%d-%H%M%S)"
      backup="''${target}.backup-''${timestamp}"

      mv -- "$target" "$backup"
    '';
    users.hung = { imports = [ ../homemanager/homemanager.nix ]; };
  };
}
