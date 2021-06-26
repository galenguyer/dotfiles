#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="git"

log info applying gitconfig
log silly backing up gitconfig
[ -e "$HOME/.gitconfig" ] && [ ! -e "$HOME/.gitconfig.bak" ] && cp "$HOME/.gitconfig" "$HOME/.gitconfig.bak"
rm "$HOME/.gitconfig"
log silly linking gitconfig
ln -s "$DOT_ROOT/modules/040-git/.gitconfig" "$HOME/.gitconfig"
