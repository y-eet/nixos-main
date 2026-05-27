{ config, pkgs, ... }:
{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot.initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    nvidiaSettings = true;

    # RTX 50-series should use the open kernel module path.
    open = true;

    # Easy baseline. Later, if you must pin 595 specifically, we can replace this
    # with a mkDriver override or an external NVIDIA package source.
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  powerManagement.cpuFreqGovernor = "performance";
  zramSwap.enable = true;

  environment.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    NVD_BACKEND = "direct";
    __GL_VRR_ALLOWED = "1";
    __GL_GSYNC_ALLOWED = "1";
  };

  environment.systemPackages = with pkgs; [
    vulkan-tools
    mesa-demos
    nvtopPackages.nvidia
  ];
}
