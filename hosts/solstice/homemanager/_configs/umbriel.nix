{
  programs.umbriel = {
    enable = true;
    settings = {
      output.eDP-1 = {
        scale = 1;
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
      events = {
        lid_close = "umbriel msg output-disable:eDP-1";
        lid_open = "umbriel msg output-enable:eDP-1";
      };
    };
  };
}
