{
  flake.modules.homeManager.helios = {
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
      };
    };
  };
}
