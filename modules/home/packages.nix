{
  flake.modules.homeManager.packages =
    { inputs, pkgs, ... }:
    {
      # Enable helium overlay
      nixpkgs.overlays = [
        inputs.helium.overlays.default
      ];
      # User-specific packages go here
      home.packages = with pkgs; [
        helium # my web browser, change if needed
        fastfetch
        nerd-fonts.jetbrains-mono
        adw-gtk3
      ];
    };
}
