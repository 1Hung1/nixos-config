{
  flake.modules.nixos.solstice = {
    services.openssh.enable = true;
    networking.firewall.enable = false;
  };
}
