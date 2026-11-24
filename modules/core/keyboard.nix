{
  flake.modules.nixos.keyboard = {
    services.xserver.xkb = {
      layout = "us,us";
      options = "caps:escape";
    };
  };
}
