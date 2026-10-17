{ pkgs, ... }:

{
  # Declarative Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild-system = "sudo nixos-rebuild switch --flake /etc/nixos#nixos-btw";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "hul10"; 
  };

  programs.alacritty = {
  	enable = true;

  	settings = {
  	  general = {
  	  	import = [
  	  		"~/.config/alacritty/themes/noctalia.toml"
  	  	];
  	  };
  	  
  	  window = {
  	    opacity = 0.75;
  	    decorations = "full";
  	  };

 	  font = {
  	    size = 12.0;
  	    normal = {
  	      family = "JetBrainsMono Nerd Font Mono"; 
  	      style = "Regular";
  	    };
  	    bold = {
  	      family = "JetBrainsMono Nerd Font Mono";
  	      style = "Bold";
  	    };
  	  };
  	};
  };
  programs.fastfetch = {
  	enable = true;

  	settings = builtins.fromJSON (builtins.readFile "${pkgs.fastfetch}/share/fastfetch/presets/examples/10.jsonc");
  };
}
