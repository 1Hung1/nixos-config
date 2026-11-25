{
  flake.modules.homeManager.helix =
    { pkgs, ... }:
    {
      programs = {
        helix = {
          enable = true;
          defaultEditor = true;
          extraPackages = with pkgs; [
            nixd
            nixfmt
          ];

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
                  q = ":bc!";
                  Q = ":q!";
                  r = ":config-reload";
                };
              };
            };
          };

          languages = {
            language-server.nixd = {
              command = "${pkgs.nixd}/bin/nixd";
              args = [ "--semantic-tokens=true" ];
            };
            language = [
              {
                name = "nix";
                auto-format = true;
                formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
              }
            ];
          };
        };
      };
    };
}
