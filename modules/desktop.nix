{ pkgs, ... }:

{
  services.xserver.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.libinput = {
    touchpad.naturalScrolling = true;
  };

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono inter ];

  programs.partition-manager.enable = true;
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [ brave zed-editor libreoffice scrcpy ];
}
