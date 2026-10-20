{ pkgs, ... }:

{
  # Declarative Git configuration
  programs.git = {
    enable = true;
    settings.user.name = "Hung";
    settings.user.email = "legiahung.ny@gmail.com";
    settings.init.defaultBranch = "main";
    settings.push.autoSetupRemote = true;
  };
}
