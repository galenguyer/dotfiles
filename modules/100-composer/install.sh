#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="composer"

log info "installing composer"
builddir=$(mktemp -d)
pwd=$(pwd)
cd $builddir
git clone https://github.com/galenguyer/composer
cd composer
sudo make install
cd $pwd
