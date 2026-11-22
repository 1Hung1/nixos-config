{ inputs, pkgs, ... }:

{
  # Home Manager settings
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
  };
}
