{ pkgs, ... }:

{
  users.users."abhinav" = {
    isNormalUser = true;
    description = "Abhinav";
    extraGroups = [ "networkmanager" "wheel" "scanner" "lp" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
      kdePackages.skanpage
    ];
  };

  # Fish is required here because it is the user's login shell.
  programs.fish.enable = true;
}
