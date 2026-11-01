{ pkgs, ... }:

{
  # Change the alias for rebuilding
  programs.zsh.shellAliases = {
    rebuild-system = "sudo nixos-rebuild switch --flake ~/nixos#solstice";
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

  # Add some of my needed programs
  home.packages = with pkgs; [
    google-chrome
    vesktop

    # TEMP
    python314
    python314Packages.pip
    # Install the LSP server
    python314Packages.python-lsp-server
    python314Packages.black
    python314Packages.flake8
    python314Packages.pylint
    python314Packages.ipython
  ];

  # Enable the LSP servers
  programs.micro = {
    enable = true;
    settings = {
      "lsp.server" = "python=pylsp";
      "lsp.formatOnSave" = true;
      "lsp.tabcompletion" = true;
    };
  };
}
