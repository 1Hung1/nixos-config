{
  flake.modules.nixos.boot =
    { pkgs, ... }:
    {
      boot = {
        # Use CachyOS latest kernel and set kernel cmdline
        kernelPackages = pkgs.linuxPackages_cachyos;
        kernelParams = [
          "loglevel=4"
          "udev.log-priority=4"
          "threadirqs"
          "nowatchdog"
          "usbcore.autosuspend=1"

          # Intel iGPU/dGPU kernel args
          "i915.enable_psr=1"
          "i915.enable_fbc=1"
          "i915.enable_dc=2"
        ];

        # Make all audio spec devices not go into power-save
        extraModprobeConfig = ''
          options snd_usb_audio power_save=0
        '';

        # Remove un-needed modules from initrd
        initrd.includeDefaultModules = false;
      };
    };
}
