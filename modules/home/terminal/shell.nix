{
  flake.modules.homeManager.terminal = {
    # Terminal configuration
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
      };
      oh-my-posh = {
        enable = true;
        enableZshIntegration = true;
        useTheme = "hul10";
      };
      nix-your-shell = {
        enable = true;
        enableZshIntegration = true;
        nix-output-monitor.enable = true;
      };
    };
  };
}
