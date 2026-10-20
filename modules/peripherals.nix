{ config, pkgs, ... }:

{
  hardware.bluetooth.enable = true;

  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-brother-dcpt310 ];
  };

  hardware.sane = {
    enable = true;
    brscan4.enable = true;
  };

  users.users.abhinav.extraGroups = [ "scanner" "lp" ];

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
  boot.kernelModules = [ "v4l2loopback" ];
  boot.extraModprobeConfig = ''
    options v4l2loopback exclusive_caps=1 card_label="Android Phone Camera"
  '';
}
