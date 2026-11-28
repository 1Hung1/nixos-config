{
  flake.modules.homeManager.packages =
    { inputs, pkgs, ... }:
    {
      # User-specific packages go here
      home.packages = with pkgs; [
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default # my web browser, change if needed
        fastfetch
        nerd-fonts.jetbrains-mono
        adw-gtk3
      ];
    };
}
