#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="kde"

log info setting kde configs

log silly "linking konsole configurations"
rm -r "$HOME/.local/share/konsole"
ln -s "$DOT_ROOT/modules/041-kde/konsole" "$HOME/.local/share/konsole"

log silly "linking ~/.config/kdedefaults"
rm -r "$HOME/.config/kdedefaults"
ln -s "$DOT_ROOT/modules/041-kde/.config/kdedefaults" "$HOME/.config/kdedefaults"

log silly "linking ~/.config/kdeglobals"
rm -r "$HOME/.config/kdeglobals"
ln -s "$DOT_ROOT/modules/041-kde/.config/kdeglobals" "$HOME/.config/kdeglobals"

log silly "linking ~/.config/kcminputrc"
rm -r "$HOME/.config/kcminputrc"
ln -s "$DOT_ROOT/modules/041-kde/.config/kcminputrc" "$HOME/.config/kcminputrc"

log silly "linking ~/.kde4"
rm -r "$HOME/.kde4"
ln -s "$DOT_ROOT/modules/041-kde/.kde4" "$HOME/.kde4"

