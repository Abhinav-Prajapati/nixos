{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  programs.fish.enable = true;
  home.file.".config/fish/conf.d/10-user-config.fish".source = ./config/fish/config.fish;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = "[ ](blue)$directory$git_branch$character";
    };
  };

  home.file.".config/plasma-workspace/env/gpu.sh" = {
    source = ./scripts/gpu.sh;
    executable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 4; y = 2; };
        dynamic_padding = true;
        opacity = 0.95;
      };

      font = {
        size = 12.0;
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
      };

      cursor.style = { shape = "Beam"; blinking = "On"; };
      selection.save_to_clipboard = true;
    };
  };

  programs.tmux = {
    enable = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.tmux-nova;
        extraConfig = builtins.readFile ./config/tmux/tmux.conf;
      }
    ];
  };

  programs.zoxide = {
    enable = true;
    options = [ "--cmd cd" ];
  };

  programs.fzf = {
    enable = true;
  };

  programs.eza = {
    enable = true;
    icons = "auto";
    git = true;
  };

  programs.bat.enable = true;

  home.packages = with pkgs; [
    ripgrep
    fd
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Abhinav";
      email = "abhinav.is.dev@gmail.com";
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
