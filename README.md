# nixos

My personal NixOS configuration, featuring a dendritic pattern layout. This configuration uses the **dendritic pattern** — a feature-oriented module system where every `.nix` file is a self-contained module, auto-imported via `import-tree`. No central `imports` lists are maintained.

The configuration manages two x86_64-linux hosts:

- **`solstice`** — my daily driver laptop with LUKS full-disk encryption + LVM
- **`helios`** — my mini pc with LVM

Host-agnostic modules live in `modules/`, organized by concern:

| Directory | Purpose |
|---|---|
| `modules/core/` | Bootloader, system timezone/locale, Nix settings, kernel |
| `modules/services/` | Display manager, network, keyring, BPF scheduler |
| `modules/programs/` | Desktop (Umbriel+Noctalia), CLI tools, Qt packages |
| `modules/users/` | Home Manager + user `hung` configuration |
| `modules/home/` | Home Manager modules: base, cursor, micro, noctalia, packages, terminal, umbriel |
| `modules/hosts/common.nix` | Shared config imported by all hosts |
| `modules/hosts/solstice/` | Laptop-specific modules (boot, filesystems, HM, etc.) |
| `modules/hosts/helios/` | Mini PC-specific modules (boot, filesystems, HM, etc.) |

## Key Pattern — Dendritic

Rather than per-host directories with manual `imports` lists, every `.nix` file under `modules/` is a self-contained flake-parts module. The `import-tree` tool recursively discovers and imports all `.nix` files, so adding a new feature means adding a single file — nothing else needs to change.

**`flake.nix`** (relevant snippet):

```nix
outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } {
  imports = [
    inputs.flake-parts.flakeModules.modules
    (inputs.import-tree ./modules)
  ];
};
```

**Benefits:**

- No merge conflicts on shared `imports` lists
- Each concern (ssh, bluetooth, desktop) lives in one file across all hosts
- File path serves as documentation — files can be freely renamed or split
- Cross-class cohesion: one file can configure NixOS, Home Manager, and Darwin together

## Usage

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

3. Make the new files visible to Nix flakes:

   ```bash
   git add -N modules/hosts/normal
   ```

   Nix flakes using Git only include files known to Git. This command makes the new files visible without staging their contents. Alternatively, use `git add modules/hosts/normal` if you intend to stage them.

4. Review the configuration before activating it. In particular, check the root filesystem, boot partition, bootloader, networking, username, and any hardware-specific settings. Adjust anything that doesn't match your machine.

5. Build and activate the configuration:

   ```bash
   sudo nixos-rebuild switch --flake ~/nixos#normal
   ```

6. Reboot if necessary and verify that your system works as expected.
