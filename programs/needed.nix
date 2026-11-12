{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    micro
    wget
    curl
  ];
  programs.zsh.enable = true;
}
