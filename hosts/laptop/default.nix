{
  imports = [
    # Set the max charge limit to 80%
    ./battery-life.nix

    # Import filesystems and important stuff
    ./core/filesystems.nix
    ./core/boot.nix
    ./core/sudo.nix
    ./hardware/hardware-configuration.nix

    # Import my homemanager config
    ./homemanager/hung.nix
  ];
}
