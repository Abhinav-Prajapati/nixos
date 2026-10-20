{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.partition-manager.enable = true;

  programs.firefox.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    # Apps
    brave
    zed-editor

    # CLI essentials
    git
    wget
    curl
    unzip

    pkgs.libreoffice
    pkgs.scrcpy

  ];
}
