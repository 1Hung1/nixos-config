{
  flake.modules.homeManager.terminal =
    { pkgs, ... }:
    {
      programs.fastfetch.enable = true;

      # Fastfetch configuration file
      xdg.configFile."fastfetch/config.jsonc".source =
        "${pkgs.fastfetch}/share/fastfetch/presets/examples/10.jsonc";
    };
}
