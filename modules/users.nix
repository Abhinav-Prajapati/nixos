{ pkgs, ... }:

{
  users.users."abhinav" = {
    isNormalUser = true;
    description = "Abhinav";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  # Shell & prompt
  programs.fish.enable = true;
  programs.starship.enable = true;
}
