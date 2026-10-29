{ inputs, pkgs, ... }:

{
  imports = [ inputs.qtengine.nixosModules.default ];

  environment.systemPackages = with pkgs.kdePackages; [
    breeze
    breeze-icons
  ];
  
  programs.qtengine = {
    enable = true;

    config = {
      theme = {
        colorScheme = "~/.local/share/color-schemes/noctalia.colors";
        iconTheme = "breeze-dark";
        style = "breeze";

        font = {
          family = "JetBrainsMono Nerd Font Mono";
          size = 12;
          weight = -1;
        };

        fontFixed = {
          family = "JetBrainsMono Nerd Font Mono";
          size = 12;
          weight = -1;
        };
      };

      misc = {
        singleClickActivate = false;
        menusHaveIcons = true;
        shortcutsForContextMenus = true;
      };
    };
  };
}
