{
  flake.modules.homeManager.helix = {
    programs = {
      helix = {
        enable = true;
        defaultEditor = true;

        settings = {
          theme = "noctalia";

          editor = {
            auto-pairs = false;
            color-modes = true;
            bufferline = "multiple";
            scrolloff = 100;
            mouse = true;
            popup-border = "all";
            end-of-line-diagnostics = "hint";
            cursor-shape.insert = "bar";
            inline-diagnostics.cursor-line = "info";
            statusline = {
              left = [
                "mode"
                "spinner"
              ];
              center = [
                "file-name"
                "read-only-indicator"
                "file-modification-indicator"
              ];
              right = [
                "diagnostics"
                "file-type"
                "file-encoding"
                "file-line-ending"
              ];
              workspace-diagnostics = [
                "info"
                "warning"
                "error"
              ];
            };
            lsp = {
              display-inlay-hints = true;
              display-progress-messages = true;
            };
            indent-guides = {
              render = true;
              character = "⸽";
              skip-levels = 1;
            };
          };
          keys = {
            normal = {
              space = {
                w = ":w!";
                q = ":q!";
                r = ":config-reload";
              };
            };
          };
        };
      };
    };
  };
}
