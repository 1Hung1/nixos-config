{
  flake.modules.nixos.solstice = { config, ... }:
    {
      users.users.hung.hashedPasswordFile = config.age.secrets.login-password-hash.path;
    };
}
