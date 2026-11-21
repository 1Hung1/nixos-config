{ config, inputs, lib, ... }:

{
  home-manager.users.hung.imports = [
    (inputs.import-tree.initFilter (lib.hasSuffix ".nix") ./_homemanager)
  ];
  users.users.hung.hashedPasswordFile =
    config.age.secrets.login-password-hash.path;
}
