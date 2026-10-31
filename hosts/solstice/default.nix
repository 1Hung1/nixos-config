{
  imports = [
    # Import important stuff
    ./core
    ./services
    ./hardware/hardware-configuration.nix

    # Import my homemanager config
    ./homemanager/hung.nix

    # Install my needed programs
    ./programs.nix
  ];
}
