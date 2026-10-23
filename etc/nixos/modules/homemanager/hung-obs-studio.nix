{
  programs.obs-studio = {
    enable = true;
    package = pkgs.obs-studio;
    plugins = with pkgs.obs-studio-plugins; [
      # Add any desired plugins here
      obs-pipewire-audio-capture
      wlrobs
    ];
  };
  
}
