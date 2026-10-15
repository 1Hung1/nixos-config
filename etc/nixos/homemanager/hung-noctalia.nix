{ inputs, pkgs, ... }:

{
  # Import Noctalia home-manager plugin
  imports = [
  	inputs.noctalia.homeModules.default
  ];

  # Noctalia settings
  programs.noctalia = {
    settings = {
  	  config_version = 15;
  	  bar = {
  	    default = {
  	      end = [ "tray" "notifications" "network" "volume" "battery" "control-center" "session" ];
  	      start = [ "launcher" "workspaces" "wallpaper" ];
  	    };
  	  };
  	  battery = {
  	    warning_threshold = 14;
  	  };
  	  desktop_widgets = {
  	    schema_version = 2;
  	    widget_order = [  ];
  	    grid = {
  	      cell_size = 16;
  	      major_interval = 4;
  	      visible = true;
  	    };
  	    widget = {
  
        };
  	  };
  	  lockscreen_widgets = {
  	    enabled = false;
  	    schema_version = 2;
  	    widget_order = [ "lockscreen-login-box@eDP-1" ];
  	    grid = {
  	      cell_size = 16;
  	      major_interval = 4;
  	      visible = true;
  	    };
  	    widget = {
  	      "lockscreen-login-box@eDP-1" = {
  	        box_height = 196.0;
  	        box_width = 810.0;
  	        cx = 960.0;
  	        cy = 898.0;
  	        output = "eDP-1";
  	        placement_height = 1080.0;
  	        placement_width = 1920.0;
  	        rotation = 0.0;
  	        type = "login_box";
  	        settings = {
  	          background_color = "surface_variant";
  	          background_opacity = 0.88;
  	          background_radius = 12.0;
  	          center_password_text = false;
  	          input_opacity = 1.0;
  	          input_radius = 6.0;
  	          layout = "regular";
  	          show_caps_lock = true;
  	          show_keyboard_layout = true;
  	          show_login_button = true;
  	          show_media = true;
  	          show_session_buttons = true;
  	          show_unlock_hint = true;
  	          show_weather = true;
            };
  	      };
  	    };
  	  };
  	  shell = {
  	    font_family = "JetBrainsMono Nerd Font Mono";
  	    telemetry_enabled = true;
  	    umbriel_overview_type_to_launch_enabled = true;
  	    launcher = {
  	      default_view = "all";
  	    };
  	    panel = {
  	      transparency_mode = "glass";
  	    };
  	  };
  	  theme = {
  	    source = "wallpaper";
  	    wallpaper_scheme = "vibrant";
  	    templates = {
  	      builtin_ids = [ "alacritty" "gtk3" "gtk4" "qt" "umbriel" ];
  	    };
  	  };
  	  wallpaper = {
  	    transition_on_startup = true;
  	    default = {
  	      path = "/home/hung/Pictures/Wallpapers/solarsystem.png";
  	    };
  	    last = {
  	      path = "/home/hung/Pictures/Wallpapers/solarsystem.png";
  	    };
  	    monitors = {
  	      eDP-1 = {
  	        path = "/home/hung/Pictures/Wallpapers/solarsystem.png";
  	      };
  	    };
  	  };
  	};
  };
}
