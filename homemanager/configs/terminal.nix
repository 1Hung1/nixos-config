{ pkgs, lib, ... }:

{
  # zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild-system = lib.mkDefault "sudo nixos-rebuild switch --flake ~/nixos#normal";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "hul10";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    systemd.enable = true;
    settings = {
      # Font settings
      font-family = "JetBrainsMono Nerd Font Mono";
      font-size = 12;

      # Cursor settings
      cursor-style = "block";
      cursor-style-blink = false;

      # Other stuff
      background-opacity = "0.65";
      window-inherit-working-directory = false;
    };
  };

  # fastfetch configuration
  programs.fastfetch.enable = true;
  xdg.configFile."fastfetch/config.jsonc".source =
    "${pkgs.fastfetch}/share/fastfetch/presets/examples/10.jsonc";

  # micro configuration
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "noctalia";
      tabstospaces = true;
      tabsize = 2;
    };
  };

  # nix-my-shell configuration
  programs.nix-your-shell = {
    enable = true;
    enableZshIntegration = true;
    nix-output-monitor.enable = true;
  };
}
