{ inputs, pkgs, ... }:

{
  # Define a user account
  users.users."hung" = {
    isNormalUser = true;
    description = "Hung";
    extraGroups = [ "wheel" ];
    shell = pkgs.zsh;
    hashedPassword = "$y$j9T$HeNwafR54cNyu16uUzP/w1$cIgNVvwv0si9NTiNZ47wFmoq8oHbIJJ8POKcsNaLv16";
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
