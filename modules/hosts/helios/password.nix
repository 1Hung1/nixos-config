{
  flake.modules.nixos.helios =
    { config, ... }:
    {
      users.users.hung.hashedPasswordFile = config.age.secrets.login-password-hash.path;
    };
}
