{
  # Set Nix settings
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      trusted-users = [
        "root"
        "@wheel"
      ];
      auto-optimise-store = true;

      # Noctalia & Umbriel binary caches setup (umbriel uses the same cache as noctalia's)
      extra-substituters = [ "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
    };
  };

  # Enable nh for a nix helper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    clean.dates = "daily";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
