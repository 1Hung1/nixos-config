{ pkgs, ... }:

{
  # Declarative Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      rebuild-system = "sudo nixos-rebuild switch --flake ~/nixos#normal";
    };
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
    useTheme = "hul10";
  };

  # Foot settings
  programs.foot.enable = true;

  xdg.configFile."foot/foot.ini".text = ''
    include=~/.config/foot/themes/noctalia

    [main]
    font=JetBrainsMono Nerd Font Mono:size=12
    font-bold=JetBrainsMono Nerd Font Mono:style=Bold:size=12
    font-italic=JetBrainsMono Nerd Font Mono:style=Italic:size=12
    font-bold-italic=JetBrainsMono Nerd Font Mono:style=Bold Italic:size=12
    title=Foot

    [scrollback]
    lines=10000
    multiplier=3

    [cursor]
    style=block
    blink=no

    [csd]
    preferred=server

    [colors-dark]
    alpha=0.65
    blur=yes
  '';

  # Fastfetch settings
  programs.fastfetch.enable = true;
  xdg.configFile."fastfetch/config.jsonc".source = "${pkgs.fastfetch}/share/fastfetch/presets/examples/10.jsonc";

  # Declarative micro editor configuration
  programs.micro = {
    enable = true;
    settings = {
      colorscheme = "noctalia";
      tabstospaces = true;
      tabsize = 2;
    };
  };
}
