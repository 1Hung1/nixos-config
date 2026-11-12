{ pkgs, ... }:

{
  # Change the alias for rebuilding
  programs.zsh.shellAliases = {
    rebuild-system = "sudo nixos-rebuild switch --flake ~/nixos#solstice";
  };

  # Enable and setup git
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      user.name = "Hung Gia Le";
      user.email = "legiahung.ny@gmail.com";
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
      credential.helper = "libsecret";
    };
  };

  # Add some of my needed programs
  home.packages = with pkgs; [
    google-chrome
    glib
  ];

  # Umbriel settings
  programs.umbriel = {
  	enable = true;
  	settings = {
  	  output.eDP-1 = {
  	  	scale = 1;
  	  	hdr = "auto";
  	  	direct_scanout = true;
  	  };
  	  output.HDMI-A-1 = {
  	  	scale = 2;
  	  	hdr = "on";
  	  	direct_scanout = true;
  	  };
  	  events = {
  	    lid_close = "umbriel msg output-disable:eDP-1";
  	    lid_open = "umbriel msg output-enable:eDP-1";
  	  };
  	};
  };
}
