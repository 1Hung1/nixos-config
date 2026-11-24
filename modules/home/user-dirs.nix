{
  flake.modules.homeManager.user-dirs = {
    home.file."Pictures/Wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };
  };
}
