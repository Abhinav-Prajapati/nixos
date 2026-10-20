set -g fish_greeting

abbr --add g git
abbr --add nrs 'sudo nixos-rebuild switch'
abbr --add nconf 'zeditor ~/nixos'

# Start an interactive terminal in tmux, reusing an existing session.
# Leave Zed's integrated terminal outside tmux.
if status is-interactive; and not set -q TMUX; and not set -q ZED_TERM
    if tmux -u has-session -t default 2>/dev/null
        tmux -u attach-session -t default
    else if tmux -u list-sessions -F '#{session_name}' 2>/dev/null | read -l session
        tmux -u attach-session -t "$session"
    else
        tmux -u new-session -s default
    end
end
