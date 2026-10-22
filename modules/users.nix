{ pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users."abhinav" = {
    isNormalUser = true;
    description = "Abhinav";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    users.abhinav = import ../home;
  };
}
