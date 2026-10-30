{ inputs, pkgs, ... }:

{
  # Import Noctalia home-manager plugin
  imports = [ inputs.noctalia.homeModules.default ];

  # Noctalia settings
  programs.noctalia = {
    enable = true;

    settings = {
      bar = {
        default = {
          start = [ "launcher" "active_window" "workspaces" "wallpaper" ];
          center = [ ];
          end = [ "tray" "network" "battery" "clock" "session" ];
          margin_ends = 10;
          margin_edge = 6;
          capsule = true;
          background_opacity = 0.15;
          padding = 10;
          radius = 24;
          position = "bottom";
          thickness = 38;
        };
      };
      shell = {
        font_family = "JetBrainsMono Nerd Font Mono";
        telemetry_enabled = true;
        polkit_agent = true;
        password_style = "random";
        show_close_buttons = false;
        launcher = { default_view = "all"; show_app_actions = true; };
        panel = { transparency_mode = "glass"; };
        umbriel_audio_provider_enabled = true;
      };
      theme = {
        mode = "dark";
        source = "wallpaper";
        wallpaper_scheme = "vibrant";
        templates = {
          builtin_ids = [ "alacritty" "gtk3" "gtk4" "kcolorscheme" "umbriel" ];
          community_ids = [ "discord" "micro" ];
        };
      };
      wallpaper = {
        directory = "~/Pictures/Wallpapers";
        transition_on_startup = true;
        default.path = "~/Pictures/Wallpapers/forest.png";
      };
    };
  };
}
