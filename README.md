# nixos

My personal NixOS configuration, built around **Flake-parts**, the **dendritic pattern**, and **Tack** for flake input management.

The flake configures two `x86_64-linux` hosts:

- **`solstice`** — my daily-driver laptop, using LUKS + LVM.
- **`helios`** — my mini PC, using LVM.

## Structure

The repository separates reusable feature modules from host composition:

| Path | Purpose |
|---|---|
| `flake.nix` | Loads the Tack-managed inputs and initializes Flake-parts |
| `.tack/pins.toml` | Declares flake inputs, URLs, follows, and Tack settings |
| `.tack/pins.lock.json` | Generated lock data for the pinned inputs; update it with Tack |
| `.tack/default.nix` | Generated Tack resolver used by `flake.nix`; don't edit by hand |
| `hosts/common.nix` | Shared module composition used by the hosts |
| `hosts/solstice/` | Solstice host definition and machine-specific configuration |
| `hosts/helios/` | Helios host definition and machine-specific configuration |
| `modules/core/` | Bootloader, kernel, keyboard, Nix settings, system settings, Tack integration |
| `modules/services/` | System services such as audio, networking, greeter, and scheduler |
| `modules/programs/` | Desktop, CLI, and Qt-related configuration |
| `modules/home/` | Home Manager configuration for desktop, terminal, packages, Git, and user directories |
| `modules/host-only/` | Host-scoped configuration such as secrets, VPN, SSH, and temporary files |
| `modules/users/` | User and Home Manager configuration |

## Dendritic modules

This repository follows the dendritic pattern: each `.nix` file under `modules/` or `hosts/` is a Flake-parts module. The `import-tree` input discovers and imports those files, so adding a module does not require maintaining a central import list.

Modules commonly define features under `flake.modules.nixos.*` or `flake.modules.homeManager.*`. Host definitions compose those modules into `flake.nixosConfigurations.*`.

The root **`flake.nix`** is intentionally small:

```nix
{
  description = "1Hung1's nixos config";

  outputs =
    { self, ... }@args:
    let
      inputs = (import ./.tack) { overrides = args.tackOverrides or { }; };
    in
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        inputs.flake-parts.flakeModules.modules
        (inputs.import-tree ./modules)
        (inputs.import-tree ./hosts)
      ];
    };
}
```

## Flake inputs with Tack

Tack manages the flake inputs instead of the usual root-level `flake.lock`.

- Edit **`.tack/pins.toml`** to add or configure inputs, URLs, follows, and global follow policy.
- Run **`tack update`** to resolve and update the pins.
- Run **`tack tree`** to inspect the resolved input graph and follows.
- Run **`tack dedup`** to check for duplicate inputs and possible follow relationships.
- Commit the updated `.tack/pins.toml`, `.tack/pins.lock.json`, and any other intentional changes together.

Do not edit `.tack/pins.lock.json` or the generated `.tack/default.nix` manually. The latter is the resolver imported by `flake.nix`.

## Usage

Clone the repository:

```sh
git clone https://github.com/1Hung1/nixos.git ~/nixos
cd ~/nixos
```

Build and activate one of the configured hosts:

```sh
sudo nixos-rebuild switch --flake .#solstice
# or
sudo nixos-rebuild switch --flake .#helios
```

I normally use `nh os switch` from the repository.

## Adding a host

1. Create a directory under `hosts/<hostname>/`.
2. Add a host Flake-parts module that defines `flake.nixosConfigurations.<hostname>`, composing `hosts/common.nix` with the host's modules. See `hosts/solstice/host.nix` and `hosts/helios/host.nix` for the current pattern.
3. Generate the machine's hardware configuration on the target NixOS installation and place it under the host directory (for example, `hosts/<hostname>/hardware/hardware-configuration.nix`). Review it carefully.
4. Add new files to Git so the flake can see them:

   ```sh
   git add -N hosts/<hostname>
   ```

5. Review host-specific filesystems, bootloader, encryption, networking, hardware, and user settings before building.
6. Build the new host with:

   ```sh
   sudo nixos-rebuild switch --flake .#<hostname>
   ```

**Important:** hardware configuration and boot settings are machine-specific. Do not copy another host's disk identifiers, filesystem layout, Secure Boot setup, or kernel assumptions without checking that they match the target machine.
