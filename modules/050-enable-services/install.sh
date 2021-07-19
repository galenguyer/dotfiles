#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="enable-services"

if [ "$DOT_OS" == "linux_arch" ]; then
    if pacman -Q lightdm &> /dev/null; then
        log info "enabling lightdm"
        sudo systemctl enable lightdm
    fi
    log info "enabling NetworkManager"
    sudo systemctl enable NetworkManager
fi
