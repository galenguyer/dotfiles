#!/usr/bin/env bash

# set the root directory so we're not hardcoding paths
export DOT_ROOT=$(pwd)

source $DOT_ROOT/constants.sh

# keep sudo alive
if [[ ! $EUID -eq 0 ]]; then
    log info "starting sudo"
    sudo -v
    while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
fi

if [ "$1" = "dots" ]; then
    log info "installing only dots"
    dots=("zsh" "git")
    for dot in $dots; do
        for module in $DOT_ROOT/modules/**"$dot"/install.sh; do
            . $module
        done
    done
else
    for module in $DOT_ROOT/modules/**"$*"/install.sh; do
        . $module
    done
fi

# unset DOT_SPLASH for future runs
unset DOT_SPASH
