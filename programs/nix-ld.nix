{ pkgs, ... }:

{
  programs.nix-ld = {
    enable = true;
    # Add libraries if needed (uncomment the following line)
    # libraries = with pkgs; [
    #   dbus
    #   stdenv.cc.cc
    #   zlib
    #   zstd
    #   openssl
    #   glib
    #   util-linux
    #   libx11
    #   libGL
    # ];
  };
}
