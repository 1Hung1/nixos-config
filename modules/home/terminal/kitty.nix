{
  flake.modules.homeManager.terminal = {
    programs.kitty = {
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

        # Cursor animation
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

    # Kitty cursor animation file
    xdg.configFile."kitty/shaders/cursor-warp.slang".source = ./kitty-cursor.slang;
  };
}
