{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  programs.fish.enable = true;
  home.shell.enableNushellIntegration = false;
  home.file.".config/fish/conf.d/10-user-config.fish".source = ./fish.fish;

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = "[ ](blue)$directory$git_branch$character";
    };
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
        extraConfig = builtins.readFile ./tmux.conf;
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
    git
    wget
    unzip
    uv
    docker
    docker-compose
    ripgrep
    fd
    brave
    zed-editor
    libreoffice
    scrcpy
    kdePackages.kate
    kdePackages.skanpage
    vscode
    nmap
  ];

  programs.git = {
    enable = true;
    settings.user = {
      name = "Abhinav";
      email = "abhinav.is.dev@gmail.com";
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
