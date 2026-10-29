# nixos-config

My personal NixOS configuration, with a reusable `normal` configuration and host-specific settings for my laptop.

## Installation

1. Clone this repository:

   ```bash
   git clone <your-repository-url> ~/nixos
   cd ~/nixos
   ```

2. Generate a hardware configuration for your machine:

   ```bash
   sudo nixos-generate-config --show-hardware-config | tee ~/nixos/core/hardware-config.nix
   ```

   **Important:** Run this on the NixOS installation you want to configure. It detects your current hardware and mounted filesystems. Review the generated file before proceeding.

3. Make sure `core/hardware-configuration.nix` is imported by `core/default.nix`:

   ```nix
   imports = [
     ./hardware-config.nix # Uncomment this line
     # Other imports...
   ];
   ```

   If the file already exists in the imports list, you don't need to add it again.

4. Review the configuration before activating it. In particular, check the root filesystem, boot partition, bootloader, networking, username, and any hardware-specific settings. Adjust anything that doesn't match your machine.

5. Build and activate the configuration:

   ```bash
   sudo nixos-rebuild switch --flake ~/nixos#normal
   ```

6. Reboot if necessary and verify that your system works as expected.

## Notes

- `normal` is intended to be adapted for different machines. You must generate and review your own hardware configuration before using it.
- `hosts/laptop/` contains laptop-specific configuration modules.
- Back up your existing configuration before replacing hardware settings.
- This repository is a personal configuration, not a universal installer. Review all settings before applying them to your system.
