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

  # Fish is required here because it is the user's login shell.
  programs.fish.enable = true;
}
