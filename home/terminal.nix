{ pkgs, ... }:

{
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
    baseIndex = 1;
    clock24 = true;
    escapeTime = 0;
    historyLimit = 50000;
    keyMode = "vi";
    mouse = true;
    terminal = "tmux-256color";
    prefix = "M-j";
    aggressiveResize = true;
    plugins = [
      {
        plugin = pkgs.tmuxPlugins.tmux-nova;
        extraConfig = ''
          set -g @plugin 'o0th/tmux-nova'

          set -g @nova-nerdfonts true
          set -g @nova-nerdfonts-left 
          set -g @nova-nerdfonts-right 

          set -g @nova-segment-mode "#{?client_prefix,Λ,λ}"
          set -g @nova-segment-mode-colors "#50fa7b #282a36"

          set -g @nova-segment-whoami "#(whoami)@#h"
          set -g @nova-segment-whoami-colors "#50fa7b #282a36"

          set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

          set -g @nova-rows 0
          set -g @nova-segments-0-left "mode"
          set -g @nova-segments-0-right "whoami"
        '';
      }
    ];
    extraConfig = ''
      # True color support
      set -ga terminal-overrides ",xterm-256color:Tc"

      # Start pane numbering at 1
      setw -g pane-base-index 1

      set -g focus-events on
      set -g renumber-windows on
      set -as terminal-features ",alacritty*:RGB"

      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      bind -T copy-mode-vi v send -X begin-selection
      bind -T copy-mode-vi y send -X copy-selection-and-cancel

      bind r source-file ~/.config/tmux/tmux.conf \; display-message "tmux config reloaded!"

      # Keep this last so it overrides any earlier status-position setting.
      set-option -g status-position top
    '';
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
}
