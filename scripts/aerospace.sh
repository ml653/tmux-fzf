#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/.envs"

sessions="$(~/git/personal/dotfiles/bin/aerospace_fzf.zsh)"

FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --header='Select target session.'"

target_origin=$(printf "%s\n[cancel]" "$sessions" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS $TMUX_FZF_PREVIEW_OPTIONS")
[[ "$target_origin" == "[cancel]" || -z "$target_origin" ]] && exit

window_id=$(echo "$target_origin" |  awk -F'|' '{print $2}' | tr -d ' ')
aerospace focus --window-id "$window_id"
