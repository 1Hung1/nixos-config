{
  flake.modules.nixos.hosts-openssh = {
    services.openssh.enable = true;
    networking.firewall.enable = false;
  };
}
