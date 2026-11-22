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
    kitty = {
      enable = true;
      enableGitIntegration = true;
      shellIntegration = {
        enableZshIntegration = true;
        mode = "no-rc no-cursor no-cwd";
      };
      settings = {
        # Cursor settings
        cursor_shape = "block";
        cursor_blink_interval = 0;

        # Cursor animations
        cursor_trail = 1;
        custom_shaders = "cursor-warp";

        # Other stuff
        background_opacity = "0.65";
        enable_audio_bell = false;
        scrollback_lines = 10000;
      };
      font = {
        name = "JetBrainsMono Nerd Font Mono";
        size = 12; 
      };
      extraConfig = ''
        include themes/noctalia.conf
      '';
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
  # Kitty cursor animation file
  xdg.configFile."kitty/shaders/cursor-warp.slang".source =
    ./kitty-cursor.slang;
}
