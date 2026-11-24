# nixos-config

My personal NixOS configuration, featuring a dendritic pattern layout. This configuration uses the **dendritic pattern** — a feature-oriented module system where every `.nix` file is a self-contained module, auto-imported via `import-tree`. No central `imports` lists are maintained.

The configuration manages two x86_64-linux hosts:

- **`solstice`** — laptop with dGPU, LUKS full-disk encryption, WireGuard/ProtonVPN
- **`helios`** — mini PC with iGPU, WireGuard/ProtonVPN

Host-agnostic modules live in `modules/`, organized by concern:

| Directory | Purpose |
|---|---|
| `modules/core/` | Bootloader, system timezone/locale, Nix settings, kernel |
| `modules/services/` | Display manager, network, keyring, BPF scheduler |
| `modules/programs/` | Desktop (KDE/Qt), CLI tools, Qt packages |
| `modules/users/` | Home Manager + user `hung` configuration |
| `modules/home/` | Home Manager modules: base, cursor, micro, nocturia, packages, terminal, umbriel |
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

## Hosts

### `solstice` (laptop)

Built from `modules/hosts/solstice/` modules plus shared `modules/hosts/common.nix`. Includes:

- Bootloader (systemd-boot + lancaboote/secureboot)
- Filesystems (btrfs root + nix + home subvolumes)
- Kernel (Cachyos) + CPU microcode + audio config
- Networking (Networkd + iwd + resolved DNS)
- Services (ly DM, pipewire audio, sched-ext/scx, flatpak, oo7 keyring)
- WireGuard/ProtonVPN, sbctl, battery charge thresholds
- Home Manager: nocturia + umbriel bars, settings, keybinds

### `helios` (mini PC)

Built from `modules/hosts/helios/` modules plus shared `modules/hosts/common.nix`. Includes:

- Bootloader (systemd-boot + lanzaboote)
- Filesystems (btrfs root + nix + home subvolumes)
- Kernel (latest linuxPackages_latest) + iGPU config
- Networking (Networkd + iwd + resolved DNS)
- Services (same as solstice but with HDMI-A-1 output config for umbriel)
- WireGuard/ProtonVPN
- Home Manager: nocturia + umbriel with HDMI-A-1 output, color settings

## Usage

```bash
# Build solstice
sudo nixos-rebuild switch --flake .#solstice

# Build helios
sudo nixos-rebuild switch --flake .#helios
```
