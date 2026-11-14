{
  # Change the alias for rebuilding
  programs.zsh.shellAliases = {
    rebuild-system = "sudo nixos-rebuild switch --flake ~/nixos#solstice";
  };
}
