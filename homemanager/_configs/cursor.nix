{ pkgs, ... }:

let
  cursorName = "Bibata-Modern-Classic";
  cursorPackage = pkgs.bibata-cursors;
  cursorSize = 20;
in
{
  home.pointerCursor = {
    enable = true;
    name = cursorName;
    package = cursorPackage;
    size = cursorSize;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk.enable = true;
  programs.umbriel.settings = {
    input.cursor = {
      theme = cursorName;
      size = cursorSize;
    };
    environment = {
      XCURSOR_THEME = cursorName;
      XCURSOR_SIZE = toString cursorSize;
    };
  };
}
