{
  imports = [
    # Set the max charge limit to 80%
    ./battery-life.nix

    # Import filesystems and important stuff
    ./core/filesystems.nix
    ./core/boot.nix
    ./hardware/hardware-configuration.nix

    # Import my homemanager config
  ];
}
