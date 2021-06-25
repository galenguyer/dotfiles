#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
source $DOT_ROOT/lib/os.sh
DOT_MODULE="pacman"

if [ "$DOT_OS" == "linux_arch" ]; then
    log info "changing pacman preferences"
    log silly "enable color"
    [ ! -e /etc/pacman.conf.bak ] && sudo cp /etc/pacman.conf /etc/pacman.conf.bak
    sudo sed -i "s/^#Color\$/Color/" /etc/pacman.conf
    log info "Fixing makepkg compiler args"
    log silly "CFLAGS"
    sudo sed -i 's|CFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"|CFLAGS="-march=native -O3 -pipe -fno-plt"|' /etc/makepkg.conf
    log silly "CXXFLAGS"
    sudo sed -i 's|CXXFLAGS="-march=x86-64 -mtune=generic -O2 -pipe -fno-plt"|CXXFLAGS="-march=native -O3 -pipe -fno-plt"|' /etc/makepkg.conf
    log silly "RUSTFLAGS"
    sudo sed -i 's|#RUSTFLAGS="-C opt-level=2"|RUSTFLAGS="-C opt-level=2 -C target-cpu=native"|' /etc/makepkg.conf
    log silly "MAKE"
    sudo sed -i 's|#MAKEFLAGS="-j2"|MAKEFLAGS="-j$(expr $(nproc) - 2)"|' /etc/makepkg.conf
fi
