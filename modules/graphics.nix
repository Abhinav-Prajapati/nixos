{ config, ... }:

{
  # --- Base graphics stack ---
  hardware.graphics = {
    enable = true;
    enable32Bit = true;   # for Steam / Wine / 32-bit apps
  };

  # --- NVIDIA (RTX 3050 Laptop + Intel iGPU, PRIME offload) ---
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Ampere supports the open kernel module. Set true to try it.
    open = false;

    powerManagement = {
      enable = false;
      finegrained = false;
    };

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;   # provides the `nvidia-offload` command
      };
      # From lspci: 00:02.0 (Intel) and 01:00.0 (NVIDIA)
      intelBusId  = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # --- Wayland: render the desktop on the NVIDIA GPU (card0) ---
  # card0 owns the HDMI port. The first device listed is the primary renderer.
  environment.sessionVariables.KWIN_DRM_DEVICES = "/dev/dri/card0:/dev/dri/card1";
}
