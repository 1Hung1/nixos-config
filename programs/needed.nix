{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    micro
    wget
    curl
    git
  ];
  programs.zsh.enable = true;
}
