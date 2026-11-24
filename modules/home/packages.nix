{
  flake.modules.homeManager.packages = { pkgs, ... }:
    {
      # User-specific packages go here
      home.packages = with pkgs; [
        google-chrome # my web browser, change if needed
        fastfetch
        nerd-fonts.jetbrains-mono
        adw-gtk3
      ];
    };
}
