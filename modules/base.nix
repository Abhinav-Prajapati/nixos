{ pkgs, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
    };
    efi.canTouchEfiVariables = true;
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
  };
  nixpkgs.config.allowUnfree = true;

  networking.networkmanager.enable = true;
  virtualisation.docker.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_IN";

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };
  systemd.oomd.enableUserSlices = true;
}