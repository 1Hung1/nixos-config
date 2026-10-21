{ inputs, pkgs, ... }:

{
  # Import Noctalia home-manager plugin
  imports = [
  	inputs.noctalia.homeModules.default
  ];

  # Noctalia settings
  programs.noctalia = {
    enable = true;
    
    settings = {
  	  bar = {
  	    default = {
  	      end = [ "tray" "notifications" "network" "volume" "battery" "control-center" "session" ];
  	      start = [ "launcher" "workspaces" "wallpaper" ];
  	    };
  	  };
  	  shell = {
  	    font_family = "JetBrainsMono Nerd Font Mono";
  	    telemetry_enabled = true;
  	    launcher = {
  	      default_view = "all";
  	    };
  	    panel = {
  	      transparency_mode = "glass";
  	    };
  	  };
  	  theme = {
  	    mode = "dark";
  	    source = "wallpaper";
  	    wallpaper_scheme = "vibrant";
  	    templates = {
  	      builtin_ids = [ "alacritty" "gtk3" "gtk4" "qt" "umbriel" ];
  	      community_ids = [ "micro" "fastfetch" ];
  	    };
  	  };
  	  wallpaper = {
  	    transition_on_startup = true;
  	    default.path = "~/Pictures/Wallpapers/solarsystem.png";
  	  };
  	};
  };
}
