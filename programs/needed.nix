{ pkgs, ... }:

{
  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    micro
    wget
    curl
  ];
  programs.zsh.enable = true;

  # Enable appimage support
  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
