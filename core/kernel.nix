{ pkgs, lib, ... }:

{
  boot = {
    # Use latest kernel and set kernel cmdline
    kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;
    kernelParams = [
      "loglevel=4"
      "udev.log-priority=4"
      "threadirqs"
      "nowatchdog"
      "usbcore.autosuspend=1"
    ];

    # Make all audio spec devices not go into power-save
    extraModprobeConfig = ''
      options snd_usb_audio power_save=0
    '';
  };
}
