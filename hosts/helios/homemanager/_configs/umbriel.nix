{
  programs.umbriel = {
    enable = true;
    settings = {
      output."HDMI-A-1" = {
        hdr = "auto";
        direct_scanout = true;
        workspace_axis = "horizontal";
        workspaces = [
          "1"
          "2"
          "3"
          "4"
          "5"
        ];
      };
      environment = {
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "qtengine";
        QT_QPA_PLATFORMTHEME_QT6 = "qtengine";
        SDL_VIDEODRIVER = "wayland";
      };
      keybinds = {
        "Mod+Print" = "spawn noctalia msg screenshot-region --annotate";
      };
    };
  };
}
