#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="kde"

log info setting kde configs
rm -r "$HOME/.kde4"
log silly linking kde
ln -s "$DOT_ROOT/modules/041-kde/.kde4" "$HOME/.kde4"
