# nixos-config

My personal NixOS configuration, with a `normal` configuration for most machines and a `solstice` configuration for my laptop.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/1Hung1/nixos-config ~/nixos
   cd ~/nixos
   ```

2. Generate a hardware configuration for your machine:

   ```bash
   sudo nixos-generate-config --show-hardware-config | tee ~/nixos/core/hardware-config.nix
   ```

   **Important:** Run this on the NixOS installation you want to configure. It detects your current hardware and mounted filesystems. Review the generated file before proceeding.

3. Make sure `core/hardware-config.nix` is imported by `core/default.nix`:

   ```nix
   imports = [
     ./hardware-config.nix # Uncomment this line
     # Other imports...
   ];
   ```

   If the file already exists in the imports list, you don't need to add it again.

4. Make the new file visible to Nix flakes:

   ```bash
   git add -N core/hardware-config.nix
   ```

   Nix flakes using Git only include files known to Git. This command makes the new file visible without staging its contents. Alternatively, use `git add core/hardware-config.nix` if you intend to stage it.

5. Review the configuration before activating it. In particular, check the root filesystem, boot partition, bootloader, networking, username, and any hardware-specific settings. Adjust anything that doesn't match your machine.

6. Build and activate the configuration:

   ```bash
   sudo nixos-rebuild switch --flake ~/nixos#normal
   ```

7. Reboot if necessary and verify that your system works as expected.

## Notes

- `normal` is intended to be adapted for different machines. You must generate and review your own hardware configuration before using it.
- `hosts/solstice/` contains my laptop-specific configuration modules.
- Back up your existing configuration before replacing hardware settings.
- This repository is a personal configuration, not a universal installer. Review all settings before applying them.
