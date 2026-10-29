{ inputs, pkgs, lib, ... }:

{
  # Set time zone and locale
  time.timeZone = lib.mkDefault "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  security.sudo.enable = true;

  system.stateVersion = "26.11";
}
