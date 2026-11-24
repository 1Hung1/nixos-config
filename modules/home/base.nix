{
  flake.modules.homeManager.base = {
    home.stateVersion = "26.11";

    # Let Home Manager manage itself when changes are applied
    programs.home-manager.enable = true;
  };
}
