{ config, pkgs, lib, ... }:

{
  # DisplayLink & EVDI Setup (for the USB monitor screen)
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ];

  boot.extraModulePackages = [ config.boot.kernelPackages.evdi ];
  boot.kernelModules = [ "evdi" "kvm-intel" "uinput" "wacom" "hid_wacom" ];

  nixpkgs.overlays = [
    (final: prev: {
      linuxPackages_latest = prev.linuxPackages_latest.extend (lfinal: lprev: {
        evdi = lprev.evdi.overrideAttrs (old: {
          version = "git";
          src = pkgs.fetchFromGitHub {
            owner = "DisplayLink";
            repo = "evdi";
            rev = "v1.15.1"; 
            hash = "sha256-3g6OETXJSf6AScJ2K9F67mPlh3Wpi20Yq+f+xe78p9Y=";
          };
          patches = [];
          # Rename conflicting kzalloc_obj macro to prevent kernel collision
          postPatch = ''
            substituteInPlace module/evdi_debug.h \
              --replace "kzalloc_obj" "evdi_kzalloc_obj"
            substituteInPlace module/*.c \
              --replace "kzalloc_obj" "evdi_kzalloc_obj"
          '';

          postBuild = ''
            make library
          '';

          # Generate the companion .cer file required by the new module aggregation check
          postInstall = ''
            for d in $out/lib/modules/*; do
              if [ -d "$d" ]; then
                mkdir -p "$d/kernel/drivers/gpu/drm/evdi"
                touch "$d/kernel/drivers/gpu/drm/evdi/evdi.ko.cer"
              fi
            done
          '';
        });
      });
    })
  ];

  environment.systemPackages = with pkgs; [
    displaylink
  ];

  systemd.services.displaylink-server = {
    enable = true;
    requires = [ "systemd-udevd.service" ];
    after = [ "systemd-udevd.service" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.displaylink}/bin/DisplayLinkManager";
      User = "root";
      Group = "root";
      Restart = "on-failure";
      RestartSec = 5;
    };
  };

  # Wacom Tablet Input Setup (for the stylus)
  services.xserver.wacom.enable = true;
}
