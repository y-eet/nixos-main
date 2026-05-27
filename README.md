# nixos-main

1. Install NixOS to the 4 TB drive.
2. Choose no desktop environment in the installer.
3. Use XFS when partitioning/formatting.
4. Boot into the new NixOS system once.
5. Pull your config from GitHub, for example:

   ```bash
   git clone https://github.com/y-eet/nixos-main.git ~/nixos-main
   cd ~/nixos-main
   ```

6. Replace the placeholder hardware file with the generated one:

   ```bash
   cp /etc/nixos/hardware-configuration.nix hosts/workstation/hardware-configuration.nix
   ```

7. Edit `flake.nix` if your installer username is not `daniel`.
8. Build:

   ```bash
   sudo nixos-rebuild switch --flake .#workstation
   ```

## Structure

```text
hosts/
  workstation/            # My main PC
modules/
  core/                   # boot, nix, user, locale, audio, networking
  hardware/               # NVIDIA + AMD hardware module
  sessions/               # Hyprland and future sessions
  programs/               # desktop apps and CLI tools
  gaming/                 # Steam, GameMode, Gamescope, MangoHud, Proton tools
home/
  hypr/                   # Hyprland Lua config
```

