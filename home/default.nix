{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  programs.fish.enable = true;
  home.file.".config/fish/conf.d/10-user-config.fish".source = ./config/fish/config.fish;

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
        decorations = "full";
      };

      font = {
        size = 12.0;
        normal = { family = "JetBrainsMono Nerd Font"; style = "Regular"; };
        bold = { family = "JetBrainsMono Nerd Font"; style = "Bold"; };
        italic = { family = "JetBrainsMono Nerd Font"; style = "Italic"; };
      };

      scrolling.history = 10000;
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
    enableFishIntegration = true;
    options = [ "--cmd dc" ];
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
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
    userName = "Abhinav";
    userEmail = "abhinav.is.dev@gmail.com";
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
