{ inputs, lib, ... }:

{
  home-manager.users.hung.imports = [ (inputs.import-tree.initFilter (lib.hasSuffix ".nix") ./_configs) ];
}
