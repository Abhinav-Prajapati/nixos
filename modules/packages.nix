{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    # Apps
    brave
    zed-editor

    # CLI essentials
    git
    wget
    curl
    unzip

  ];
}
