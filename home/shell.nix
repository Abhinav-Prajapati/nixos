{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set -g fish_greeting";

    shellAbbrs = {
      g = "git";
      nrs = "sudo nixos-rebuild switch";
      nconf = "zeditor ~/nixos";
    };
  };

}
