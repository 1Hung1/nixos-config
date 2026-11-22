{ pkgs, ... }:

let
  micro-lsp = pkgs.fetchFromGitHub {
    owner = "AndCake";
    repo = "micro-plugin-lsp";
    rev = "master";
    # Replace with the real hash printed by Nix on your first rebuild
    hash = "sha256-0an688Bc+ZtJ4JHqMfD8UAsCoKgQs6A+DRgfr1QpYG0=";
  };
in
{
  # Add nixfmt (for formatting) and nixd (for a lsp server)
  home.packages = with pkgs; [
    nil
    nixfmt
  ];
  
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "noctalia";
      tabstospaces = true;
      tabsize = 2;
      "lsp.server" = "nix=nil";
      "lsp.formatOnSave" = true;
      "lsp.tabcompletion" = true;
    };
  };

  # Install the micro LSP servers plugin
  xdg.configFile."micro/plug/lsp".source = micro-lsp;
}
