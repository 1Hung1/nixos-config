{ pkgs, ... }:

{
  # Declarative Git configuration
  programs.git = {
    enable = true;
    settings.user.name = "Hung"; # Change if needed
    settings.user.email = "legiahung.ny@gmail.com"; # Change if needed
    settings.init.defaultBranch = "main";
  };
}
