#/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="vim"

log info applying vimrc
log silly backing up vimrc
[ -e "$HOME/.vimrc" ] && [ ! -e "$HOME/.vimrc.bak" ] && cp "$HOME/.vimrc" "$HOME/.vimrc.bak"
log silly linking vimrc
rm "$HOME/.vimrc"
ln -s "$DOT_ROOT/modules/040-vim/.vimrc" "$HOME/.vimrc"
log silly installing vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall

