{
  config,
  ...
}:

{
  flake.modules.nixos.common.imports = with config.flake.modules.nixos; [
    bootloader
    system
    kernel
    nix
    services
    network
    keyring
    scheduler
    desktop
    cli
    qt
    home-manager
    hung
  ];
}
