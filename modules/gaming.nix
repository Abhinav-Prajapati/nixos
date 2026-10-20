{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];   # Proton-GE
    extraPackages = [ pkgs.pulseaudio ];            # provides pactl
  };

  programs.gamemode.enable = true;
}
