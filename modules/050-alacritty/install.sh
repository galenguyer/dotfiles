#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="alacritty"

log info applying alacritty config

if [ "$DOT_OS" = "linux_arch" ]; then
    if pacman -Q alacritty &>/dev/null; then
        log silly linking alacritty config
        [ -e "$HOME/.config/alacritty" ] && rm -rf "$HOME/.config/alacritty"
        ln -sf "$DOT_ROOT/modules/050-alacritty/config" "$HOME/.config/alacritty"
    fi
fi
