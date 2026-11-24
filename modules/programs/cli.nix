{
  flake.modules.nixos.cli =
    { pkgs, ... }:
    {
      # System programs/executables go here
      environment.systemPackages = with pkgs; [
        micro
        wget
        curl
        git
      ];
      programs.zsh.enable = true;
    };
}
