# Replace this file with /etc/nixos/hardware-configuration.nix from your fresh install.
# Do not copy somebody else's disk UUIDs here.
{ lib, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Placeholder only. The NixOS installer will generate the real fileSystems,
  # swapDevices, boot.initrd.availableKernelModules, etc.
}
