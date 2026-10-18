{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  services.printing = {
    enable = true;
    drivers = [ pkgs.cups-brother-dcpt310 ];
  };

  hardware.sane = {
    enable = true;
    brscan4.enable = true;
  };
}
