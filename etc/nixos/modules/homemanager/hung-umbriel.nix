{ inputs, pkgs, ... }:

{
  # Import Umbriel home-manager plugin
  imports = [
    inputs.umbriel.homeModules.default
  ];

  # Set everything up
  programs.umbriel = {
    enable = true;
    
    settings = {
      include.optional = {
        files = [ "~/.config/umbriel/noctalia.toml" ];
      };

      # General settings
      general = {
        autostart = [ "noctalia" ];
        mod_key = "Super";
        xwayland = true;
        xwayland_native_resolution = true;
        show_cheatsheet = true;
        focus_on_activate = true;
        honor_restored_maximize = true;
      };

      # Appearance settings
      appearance = {
        prefer_no_csd = true;
        border_width = 4;
        corner_radius = 12;
        blur = {
          enabled = true;
          optimized = true;
          passes = 3;
          radius = 3;
          noise = 0.02;
          contrast = 0.9;
          saturation = 1.1;
        };
      };

      # Input settings
      input = {
        middle_click_paste = false;
        client_window_drag = true;
        keyboard = {
          numlock_toggle = true;
        };
        touchpad = {
          tap = true;
          natural_scroll = true;
          left_handed = true;
          accel_profile = "flat";
          disable_while_typing = false;
          disable_on_external_mouse = false;
        };
        focus = {
          follows_mouse = true;
        };
        tablet = {
          enabled = true;
          map_to_output = "DVI-I-1";
        };
      };

      # Display (outputs) settings
      output.eDP-1 = {
        scale = 1;
        hdr = "auto";
        direct_scanout = true;
        position = [ 0 0 ];
      };
      output.DVI-I-1 = {
        position = [ 0 1080 ];
      };

      # Keybind settings
      keybinds = {
        # Application keybinds
        "Mod+Return" = "spawn:alacritty";
        "Mod+D" = "spawn:noctalia msg panel-toggle launcher";
        "Mod+Q" = "window-close";
        "Ctrl+Alt+Delete" = "session-quit";
        "Mod+I" = "spawn:noctalia msg settings-toggle";

        # Focus and movement keybinds
        "Alt+Tab" = "spawn:noctalia msg window-switcher hold";
        "Mod+Left" = "window-focus-left";
        "Mod+Right" = "window-focus-right";
        "Mod+Up" = "window-focus-previous";
        "Mod+Down" = "window-focus-next";
        "Mod+Ctrl+Left" = "column-move-left";
        "Mod+Ctrl+Down" = "window-move-down";
        "Mod+Ctrl+Up" = "window-move-up";
        "Mod+Ctrl+Right" = "column-move-right";

        # Workspaces keybinds
        "Mod+1" = "workspace-switch:1";
        "Mod+2" = "workspace-switch:2";
        "Mod+3" = "workspace-switch:3";
        "Mod+4" = "workspace-switch:4";
        "Mod+5" = "workspace-switch:5";
        "Mod+6" = "workspace-switch:6";
        "Mod+7" = "workspace-switch:7";
        "Mod+8" = "workspace-switch:8";
        "Mod+9" = "workspace-switch:9";
        "Mod+Ctrl+1" = "window-move-to-workspace:1";
        "Mod+Ctrl+2" = "window-move-to-workspace:2";
        "Mod+Ctrl+3" = "window-move-to-workspace:3";
        "Mod+Ctrl+4" = "window-move-to-workspace:4";
        "Mod+Ctrl+5" = "window-move-to-workspace:5";
        "Mod+Ctrl+6" = "window-move-to-workspace:6";
        "Mod+Ctrl+7" = "window-move-to-workspace:7";
        "Mod+Ctrl+8" = "window-move-to-workspace:8";
        "Mod+Ctrl+9" = "window-move-to-workspace:9";

        # Window management keybinds
        "Mod+V" = "window-toggle-floating";
        "Mod+Ctrl+F" = "window-toggle-maximize-to-edges";
        "Mod+Shift+F" = "window-toggle-fullscreen";
        "Mod+F" = "window-toggle-maximize";
        "Mod+R" = "window-cycle-primary-extent";
        "Mod+Shift+R" = "window-cycle-primary-extent-back";
        "Mod+Comma" = "window-consume-right";
        "Mod+Period" = "window-consume-or-expel-left";
        "Mod+W" = "column-toggle-tabbed";

        # Screenshots
        "Print" = "spawn:noctalia msg screenshot-region";

        # Media controls
        "XF86AudioRaiseVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+";
        "XF86AudioLowerVolume" = "spawn:wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
        "XF86MonBrightnessUp" = "spawn:brightnessctl set +5%";
        "XF86MonBrightnessDown" = "spawn:brightnessctl set 5%-";
        "XF86AudioPlay" = "spawn:playerctl play-pause";
        "XF86AudioNext" = "spawn:playerctl next";
        "XF86AudioPrev" = "spawn:playerctl previous";
      };

      # Layout settings
      layout = {
        mode = "scrolling";
        gap = 14;
        extent_presets = [ 0.333 0.5 0.667 ];
        scrolling = {
          default_extent_fraction = 0.5;
          center_underfull_strip = true;
        };
      };

      # Window and layer rules settings
      window_rule = [ {
          blur = true;
          blur_optimized = true;
        } {
          match = {
            app_id = "^dev.noctalia.Noctalia$";
          };
          default_floating = true;
          default_floating_size_px = {
            width = 1020;
            height = 900;
          };
        } {
          match = {
            app_id = "^dev.noctalia.UmbrielSharePicker$";
          };
          default_floating = true;
          default_floating_size_px = {
            width = 800;
            height = 600;
          };
        } {
          match = {
            title = "^notificationtoasts_.+_desktop";
          };
          default_position = {
            x = 0;
            y = 0;
            anchor = "bottom_right";
          };
          default_focused = false;
          default_pinned = true;
        } ];
      layer_rule = [ {
        match = {
          namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
        };
        blur = true;
        blur_ignore_alpha = 0.5;
        blur_popups = true;
        blur_optimized = false;
      } ];

      # Event settings
      events = {
        lid_close = "umbriel msg output-disable:eDP-1";
        lid_open = "umbriel msg output-enable:eDP-1";
      };

      # Other settings
      screencast = {
        disable_dynamic_confirmation = false;
      };
    };
  };
}
