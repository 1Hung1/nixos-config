{
  config,
  ...
}:

{
  flake.modules.nixos.hung =
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

      # The user's cross-host Home Manager aspects.
      home-manager.users.hung.imports = with config.flake.modules.homeManager; [
        base
        cursor
        micro
        noctalia
        packages
        terminal
        umbriel
        user-dirs
      ];
    };
}
