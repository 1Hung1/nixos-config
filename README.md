# nixos-config

My personal NixOS configuration, featuring a `normal` configuration for generic machines, `solstice` for my laptop, and `helios` for my mini PC.

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/1Hung1/nixos-config ~/nixos
   cd ~/nixos
   ```

2. Create a host directory and generate a hardware configuration for the machine:

   ```bash
   mkdir -p ~/nixos/hosts/normal/hardware
   sudo nixos-generate-config --show-hardware-config \
     > ~/nixos/hosts/normal/hardware/hardware-configuration.nix
   ```

   **Important:** Run this on the NixOS installation you want to configure. It detects your current hardware and mounted filesystems. Review the generated file before proceeding.

   Modules are imported automatically: `import-tree` picks up every `.nix` file under `core/`, `services/`, `programs/`, `users/`, and the host directory, so there are no import lists to maintain.

3. Make the new files visible to Nix flakes:

   ```bash
   git add -N hosts/mymachine
   ```

   Nix flakes using Git only include files known to Git. This command makes the new files visible without staging their contents. Alternatively, use `git add hosts/mymachine` if you intend to stage them.

4. Review the configuration before activating it. In particular, check the root filesystem, boot partition, bootloader, networking, username, and any hardware-specific settings. Adjust anything that doesn't match your machine.

5. Build and activate the configuration:

   ```bash
   sudo nixos-rebuild switch --flake ~/nixos#normal
   ```

6. Reboot if necessary and verify that your system works as expected.

## Notes

- `normal` is the shared, hardware-less template. It cannot build a full system until a hardware configuration is created or provided.
- Hardware configuration lives in `hosts/<host>/hardware/` (eg. `hosts/normal/hardware`). Don't put it in `core/`: that directory is shared by every host, so its filesystem definitions would conflict with the per-host ones.
- `hosts/solstice/` contains my laptop-specific configuration modules.
- `hosts/helios/` contains my minipc-specific configuration modules.
- Back up your existing configuration before replacing hardware settings.
- This repository is a personal configuration, not a universal installer. Review all settings before applying them.
