{
  # Set Nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" "pipe-operators" ];
      auto-optimise-store = true;
      trusted-users = [ "root" "@wheel" ];
      abort-on-warn = false;

      # Noctalia & Umbriel binary caches setup
      extra-substituters = [ "https://umbriel.cachix.org" "https://noctalia.cachix.org" ];
      extra-trusted-public-keys = [
        "umbriel.cachix.org-1:JfNq/2yg2S6D6z4Z2dVSZrZlDPQTKtexB6GAVLD98nw="
        "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
      ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
      persistent = true;
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
