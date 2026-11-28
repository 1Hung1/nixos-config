{
  flake.modules.homeManager.terminal = {
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
        custom-shader = "${./ghostty-cursor.glsl}";

        # Other stuff
        background-opacity = "0.65";
        window-inherit-working-directory = false;
        theme = "noctalia";
        app-notifications = false;
      };
    };
  };
}
