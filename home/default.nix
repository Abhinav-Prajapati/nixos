{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    plugins = [
      {
        name = "zsh-fzf-history-search";
        src = pkgs.zsh-fzf-history-search;
      }
    ];

    initContent = builtins.readFile ./zshrc;
  };
  home.shell.enableNushellIntegration = false;

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$character";
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
 
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    profiles.default = import ./vscode-settings.nix { inherit pkgs; };
  };

  home.packages = with pkgs; [
    git
    wget
    unzip
    uv
    docker
    docker-compose
    yazi
    ripgrep
    fd
    brave
    zed-editor
    libreoffice
    scrcpy
    kdePackages.kate
    kdePackages.skanpage
    nmap
    bruno
    beekeeper-studio
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
