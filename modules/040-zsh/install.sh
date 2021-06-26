#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="zsh"

if [[ ! -f "$HOME/.zshrc" ]]; then
    log info installing oh-my-zsh
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
log info applying zshrc
log silly backing up zshrc
[ -e "$HOME/.zshrc" ] && [ ! -e "$HOME/.zshrc.bak" ] && cp "$HOME/.zshrc" "$HOME/.zshrc.bak"
rm "$HOME/.zshrc"
log silly linking zshrc
ln -s "$DOT_ROOT/modules/040-zsh/.zshrc" "$HOME/.zshrc"
