{
  imports = [
    # Enable password-less sudo
    ./sudo.nix

    # Import filesystems
    ./filesystems.nix

    # Import my boot configuration
    ./boot.nix
  ];
}
