#!/usr/bin/env bash

# set the root directory so we're not hardcoding paths
export DOT_ROOT=$(pwd)

source $DOT_ROOT/constants.sh

# keep sudo alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

for module in $DOT_ROOT/modules/**/install.sh; do
    $module
done

# unset DOT_SPLASH for future runs
unset DOT_SPASH
