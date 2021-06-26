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

log silly linking zshrc
rm "$HOME/.zshrc"
ln -s "$DOT_ROOT/modules/040-zsh/.zshrc" "$HOME/.zshrc"

log info adding zsh plugins
log silly adding zsh-users/zsh-completions
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
    git clone https://github.com/zsh-users/zsh-completions "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
else
    pwd=$(pwd)
    cd "$HOME/.oh-my-zsh/custom/plugins/zsh-completions"
    git pull
    cd $pwd
fi

log silly adding zsh-users/zsh-autosuggestions
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
else
    pwd=$(pwd)
    cd "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
    git pull
    cd $pwd
fi

log silly adding zsh-users/zsh-syntax-highlighting
if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
else
    pwd=$(pwd)
    cd "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
    git pull
    cd $pwd
fi
