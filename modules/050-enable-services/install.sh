#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="enable-services"

if [ "$DOT_OS" == "linux_arch" ]; then
    if pacman -Q sddm &> /dev/null; then
        log info "enabling sddm"
        sudo systemctl enable sddm
    fi
fi
