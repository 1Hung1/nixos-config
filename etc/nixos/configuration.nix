# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ inputs, config, pkgs, ... }:

{
  # Import needed stuff
  imports = [
    ./hardware-configuration.nix
    ./boot.nix

    # My desktop stack
    inputs.noctalia.nixosModules.default
    inputs.umbriel.nixosModules.default
  ];
  # Set Nix settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" "pipe-operators"];
    auto-optimise-store = true;
    trusted-users = [ "root" "@wheel" ];
    allowed-users = [ "*" ];
    sandbox = "relaxed";
  };

  # Set nh settings
  programs.nh = {
  	enable = true;
  	clean.enable = true;
  	clean.extraArgs = "--keep-since 3d --keep 3";
  	flake = "/etc/nixos"; # sets NH_OS_FLAKE variable for you
  };

  # Enable networking
  networking.networkmanager.enable = false;
  networking.useNetworkd = true;
  networking.wireless.iwd.enable = true;
  networking.hostName = "nixos-btw";
  services.resolved.enable = true;

  # Catch-all DHCP configuration for wireless (wl*)
  systemd.network.networks."10-wifi" = {
    matchConfig.Name = "wl*";
    networkConfig.DHCP = "yes";
  };

  services.logind.settings.Login = {
    HandleLidSwitchExternalPower = "ignore";
    HandleLidSwitchDocked = "ignore";
  };

  hardware.facter.reportPath = ./facter.json;
  # Set your time zone.
  time.timeZone = "Asia/Ho_Chi_Minh";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = false;

  # Enable the ly login manager.
  services.displayManager.ly.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Enable power related services
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  
  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."hung" = {
    isNormalUser = true;
    description = "Hung";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs; };
    users.hung = import ./hung-homemanager.nix;
  };
  
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false; # Allows the 'wheel' group to use sudo without a password
    execWheelOnly = true;       # Strict restriction: Only users in 'wheel' can run sudo
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
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

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.11"; # Did you read the comment?

}
