{ pkgs, osConfig, ... }:

{
  # Terminal configuration
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        rebuild-system = "sudo nixos-rebuild switch --flake ~/nixos#${osConfig.networking.hostName}";
      };
    };
    oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      useTheme = "hul10";
    };
    ghostty = {
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
        custom-shader = "${./ghostty-cursor-animation.glsl}";

        # Other stuff
        background-opacity = "0.65";
        window-inherit-working-directory = false;
        theme = "noctalia";
        app-notifications = false;
      };
    };
    micro = {
      enable = true;
      settings = {
        colorscheme = "noctalia";
        tabstospaces = true;
        tabsize = 2;
      };
    };
    nix-your-shell = {
      enable = true;
      enableZshIntegration = true;
      nix-output-monitor.enable = true;
    };
    fastfetch.enable = true;
  };

  # Extra stuff
  xdg.configFile."fastfetch/config.jsonc".source =
    "${pkgs.fastfetch}/share/fastfetch/presets/examples/10.jsonc";
}
