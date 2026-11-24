{
  flake.modules.nixos.helios = {
    services.openssh.enable = true;
    networking.firewall.enable = false;
  };
}
