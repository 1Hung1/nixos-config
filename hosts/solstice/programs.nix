{
  programs.steam.enable = true;
  programs.gamemode.enable = true;
  systemd.user.services.gamemoded.wantedBy = [ "graphical-session.target" ];
  users.users."hung".extraGroups = [ "gamemode" ];
}
