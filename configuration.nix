{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/networking.nix
    ./modules/memory.nix
    ./modules/graphics.nix
    ./modules/desktop.nix
    ./modules/audio.nix
    ./modules/gaming.nix
    ./modules/users.nix
    ./modules/fonts.nix
    ./modules/home-manager.nix
    ./modules/packages.nix
  ];

  system.stateVersion = "26.05";
}
