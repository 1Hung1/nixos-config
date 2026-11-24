{
  flake.modules.nixos.services-openssh = {
    services.openssh.enable = true;
    networking.firewall.enable = false;
  };
}
