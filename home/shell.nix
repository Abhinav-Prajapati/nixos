{ ... }:

{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set -g fish_greeting

      # Start an interactive terminal in tmux, reusing an existing session.
      if status is-interactive; and not set -q TMUX
        if tmux -u has-session -t default 2>/dev/null
          tmux -u attach-session -t default
        else if tmux -u list-sessions -F '#{session_name}' 2>/dev/null | read -l session
          tmux -u attach-session -t "$session"
        else
          tmux -u new-session -s default
        end
      end
    '';

    shellAbbrs = {
      g = "git";
      nrs = "sudo nixos-rebuild switch";
      nconf = "zeditor ~/nixos";
    };
  };

}
