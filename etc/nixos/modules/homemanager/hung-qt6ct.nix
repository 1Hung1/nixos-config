{ pkgs, ... }:

{
  qt = {
  	enable = true;
  	platformTheme.name = "qt6ct"; # In Home Manager, "qtct" enables both qt5ct and qt6ct config utilities

  	qt6ctSettings = {
      Appearance = {
        color_scheme_path = "/home/hung/.config/qt6ct/colors/noctalia.conf";
        custom_palette = true;
      	standard_dialogs = "xdgdesktopportal";
      	style = "Fusion";
      };
      Fonts = {
      	fixed = "JetBrainsMono Nerd Font Mono,12,-1,5,800,0,0,0,0,0,0,0,0,0,0,1,ExtraBold,0,0";
      	general = "JetBrainsMono Nerd Font Mono,12,-1,5,800,0,0,0,0,0,0,0,0,0,0,1,ExtraBold,0,0";
      };
  	};
  };
}
