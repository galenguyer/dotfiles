#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="enable-services"

if pacman -Q cinnamon &> /dev/null; then
    log info "loading cinnamon configs"
    dconf load /org/cinnamon/ < modules/200-cinnamon/cinnamon.dconf
    dconf load /org/nemo/ < modules/200-cinnamon/nemo.dconf
    dconf load /org/gtk/ < modules/200-cinnamon/gtk.dconf
    dconf load /org/gnome/ < modules/200-cinnamon/gnome.dconf
fi
