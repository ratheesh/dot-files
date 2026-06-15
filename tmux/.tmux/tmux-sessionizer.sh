#!/usr/bin/env bash
# fzf-based tmux project session switcher
dir=$(find ~/ppcport ~/arbeit -maxdepth 2 -name .git -prune -o -type d -print 2>/dev/null \
    | fzf --prompt="Session> " --height=50% --border=rounded)
[ -z "$dir" ] && exit 0
name=$(basename "$dir" | tr '.' '_')
tmux new-session -A -s "$name" -c "$dir"
tmux switch-client -t "$name" 2>/dev/null || true
