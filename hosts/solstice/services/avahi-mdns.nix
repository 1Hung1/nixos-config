{
  # Enable the Avahi daemon for mDNS/hostname broadcasting
  services.avahi = {
    enable = true;
    nssmdns4 = true; # Allows NixOS to resolve other .local clones
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      userServices = true;
    };
  };
  
}
