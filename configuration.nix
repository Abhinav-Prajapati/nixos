{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ./modules/base.nix
    ./modules/peripherals.nix
    ./modules/graphics.nix
    ./modules/desktop.nix
    ./modules/gaming.nix
    ./modules/users.nix
  ];

  system.stateVersion = "26.05";
}
