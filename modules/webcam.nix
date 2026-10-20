{ config, ... }:

{
  boot.extraModulePackages = with config.boot.kernelPackages; [
    v4l2loopback
  ];

  boot.kernelModules = [ "v4l2loopback" ];

  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Android Phone Camera"
  '';
}
