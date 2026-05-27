# Hosts

Each folder under `hosts/` is one NixOS machine.

Current:
- `workstation/` - main desktop PC

Future examples:
- `laptop/`
- `workstation/`
- `server/`

A new host usually gets its own `configuration.nix` and generated `hardware-configuration.nix`, while reusing shared modules from `modules/`.
