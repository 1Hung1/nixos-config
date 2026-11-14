{
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
        hdr = "auto";
        direct_scanout = true;
      };
      events = {
        lid_close = "umbriel msg output-disable:eDP-1";
        lid_open = "umbriel msg output-enable:eDP-1";
      };
      environment = {
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        QT_QPA_PLATFORM = "wayland";
        QT_QPA_PLATFORMTHEME = "kde";
        QT_QPA_PLATFORMTHEME_QT6 = "kde";
        FROSTSTRAP_FORCE_WAYLAND = "1";
      };
    };
  };
}
