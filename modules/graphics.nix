{ config, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Steam / Wine / 32-bit apps
  };

  # Needed so NixOS installs the NVIDIA driver (does not start an X server)
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true; # required for Wayland and HDMI under DRM
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    open = false;

    powerManagement = {
      enable = true;      # fixes black screen after lock/sleep
      finegrained = true; # dGPU sleeps when idle (only when KWIN_DRM_DEVICES is iGPU and not dGPU)
    };

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true; # provides `nvidia-offload`
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # NVIDIA renders the desktop, so HDMI is driven directly by the dGPU.
  # Check card numbers with `ls -l /dev/dri/by-path/` (card0 = NVIDIA on your machine)
  environment.sessionVariables.KWIN_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
}
