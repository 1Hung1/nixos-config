{
  flake.modules.nixos.programs-cli =
    { pkgs, ... }:
    {
      # System programs/executables go here
      environment.systemPackages = with pkgs; [
        helix
        wget
        curl
        git
      ];
      programs.zsh.enable = true;
    };
}
