{
  flake.modules.homeManager.solstice =
    { osConfig, pkgs, ... }:
    {
      # Enable and setup git
      programs.git = {
        enable = true;
        package = pkgs.gitFull;
        settings = {
          user.name = "Hung Gia Le";
          user.email = "legiahung.ny@gmail.com";
          init.defaultBranch = "main";
          push.autoSetupRemote = true;
          credential.helper = [
            ""
            "!${pkgs.writeShellScript "git-credential-github" ''
              if [ "$1" = get ]; then
                printf 'username=1Hung1\n'
                printf 'password='
                tr -d '\r\n' < ${osConfig.age.secrets.github-token.path}
                printf '\n\n'
              fi
            ''}"
          ];
        };
      };
    };
}
