{ ... }:

{
  hardware.graphics = {
    enable = true;
  };

  # Needed so NixOS installs the NVIDIA driver (does not start an X server)
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true; # required for Wayland and HDMI under DRM
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

}
