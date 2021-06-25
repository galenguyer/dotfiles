#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="bash"

log info applying bashrc
log silly backing up bashrc
[ -e "$HOME/.bashrc" ] && [ ! -e "$HOME/.bashrc.bak" ] && cp "$HOME/.bashrc" "$HOME/.bashrc.bak"
rm "$HOME/.bashrc"
log silly linking bashrc
ln -s "$DOT_ROOT/modules/040-bash/.bashrc" "$HOME/.bashrc"
