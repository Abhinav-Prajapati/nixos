{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users."abhinav" = {
    isNormalUser = true;
    description = "Abhinav";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  # Fish is required here because it is the user's login shell.
  programs.fish.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.abhinav = import ../home;
  };
}
