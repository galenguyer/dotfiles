#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="nano"

log info applying nanorc

if [ "$DOT_OS" = "linux_arch" ]; then
    log silly backing up nanorc
    [ -e "$HOME/.nanorc" ] && [ ! -e "$HOME/.nanorc.bak" ] && cp "$HOME/.nanorc" "$HOME/.nanorc.bak"
    log silly linking nanorc
    rm "$HOME/.nanorc"
    ln -s "$DOT_ROOT/modules/040-nano/.nanorc.arch" "$HOME/.nanorc"
fi
if [ "$DOT_OS" = "linux_debian" ]; then
    log silly backing up nanorc
    [ -e "$HOME/.nanorc" ] && [ ! -e "$HOME/.nanorc.bak" ] && cp "$HOME/.nanorc" "$HOME/.nanorc.bak"
    log silly linking nanorc
    rm "$HOME/.nanorc"
    ln -s "$DOT_ROOT/modules/040-nano/.nanorc.debian" "$HOME/.nanorc"
fi
