{ pkgs, ... }:

{
  # Change the alias for rebuilding
  programs.zsh.shellAliases = {
    rebuild-system = "sudo nixos-rebuild switch --flake ~/nixos#laptop";
  };

  # Enable and setup git
  programs.git = {
    enable = true;
    settings = {
      user.name = "Hung Gia Le";
      user.email = "legiahung.ny@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };
  };
}
