{
  imports = [
    # Set the battery change limit to 80%
    ./battery-life.nix

    # Enable openssh
    ./openssh.nix

    # Set the hostname
    ./hostname.nix
  ];
}
