{
  flake.modules.nixos.hung-password =
    { config, ... }:
    {
      users.users.hung.hashedPasswordFile = config.age.secrets.login-password-hash.path;
    };
}
