{ pkgs, ... }:

{
  # Define a user account (change username if needed)
  users.users."hung" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "render"
      "video"
      "audio"
      "input"
    ];
    shell = pkgs.zsh;
    # Make sure to run passwd to set a password for the account
  };
  home-manager.users.hung = {
    imports = [ ../homemanager/homemanager.nix ];
  };
}
