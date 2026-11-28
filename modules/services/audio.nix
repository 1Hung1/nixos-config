{
  flake.modules.nixos.services-audio = {
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      extraConfig.pipewire = {
        "10-clock-settings"."context.properties" = {
          "default.clock.rate" = 192000;
          "default.clock.allowed-rates" = [
            44100
            48000
            88200
            96000
            176400
            192000
          ];

          "default.clock.quantum" = 1024;
          "default.clock.min-quantum" = 64;
          "default.clock.max-quantum" = 4096;
        };
      };
    };
  };
}
