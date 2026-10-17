{ inputs, config, pkgs, ... }:

{
  # Import needed stuff
  imports = [
    ./hardware-configuration.nix
    ./modules

    # My desktop stack
    inputs.noctalia.nixosModules.default
    inputs.umbriel.nixosModules.default
  ];

  # Point to a facter.json
  hardware.facter.reportPath = ./facter.json;
  
  # Set Nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" "pipe-operators"];
      auto-optimise-store = true;
      trusted-users = [ "root" "@wheel" ];
    };
    gc = {
      automatic = true;
      dates = "daily";
      persistent = true;
      options = "--delete-old"; 
    };
  };

  # Set time zone. and locale
  time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false; # Allows the 'wheel' group to use sudo without a password
    execWheelOnly = true;       # Strict restriction: Only users in 'wheel' can run sudo
  };
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
     micro
     wget
     curl
     zsh
  ];

  # My shell and desktop stack
  programs.zsh.enable = true;
  programs.umbriel.enable = true;
  programs.noctalia.enable = true;
  # Disable the firewall altogether.
  networking.firewall.enable = false;
  
  system.stateVersion = "26.11";

}
