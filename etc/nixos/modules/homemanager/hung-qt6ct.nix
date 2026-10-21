{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";

    qt6ctSettings = {
      Appearance = {
        color_scheme_path = "~/.config/qt6ct/colors/noctalia.conf";
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
