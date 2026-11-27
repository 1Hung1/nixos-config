{
  config,
  ...
}:

{
  flake.modules.nixos.common.imports = with config.flake.modules.nixos; [
    # Core stuff
    system
    boot
    nix
    keyboard
    tack

    # Services
    services-main
    services-audio
    services-network
    services-keyring
    services-noctalia-greeter
    services-scheduler

    # Programs
    programs-desktop
    programs-cli
    programs-qtengine

    # Home Manager and users
    home-manager
    hung
  ];
}
