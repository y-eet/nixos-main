{ pkgs, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  # Latest kernel is useful for new AMD CPU + NVIDIA driver combinations.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelModules = [ "kvm-amd" ];
  boot.kernelParams = [
    "quiet"
    "loglevel=3"
    "amd_pstate=active"
    "nvidia-drm.modeset=1"
    "nvidia-drm.fbdev=1"
  ];
}
