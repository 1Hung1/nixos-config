{ pkgs, ... }:

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
      credential.helper = "libsecret";
    };
  };
}
