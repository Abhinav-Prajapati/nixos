{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        padding = { x = 10; y = 10; };
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
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    aggressiveResize = true;
    newSession = true;
    extraConfig = ''
      set -g focus-events on
      set -g renumber-windows on
      set -as terminal-features ",alacritty*:RGB"

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel

      bind r source-file ~/.config/tmux/tmux.conf \; display "tmux config reloaded"
    '';
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
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
}
