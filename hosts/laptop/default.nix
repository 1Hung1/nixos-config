{
  imports = [
    # Set the max charge limit to 80%
    ./battery-life.nix

    # Import filesystems and important stuff
    ./filesystems.nix
    ./boot.nix
    ./hardware-configuration.nix
  ];
}
