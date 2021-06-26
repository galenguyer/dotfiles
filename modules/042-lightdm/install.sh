#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="lightdm"

log info setting lightdm configs

log silly linking /etc/lightdm
sudo rm -r "/etc/lightdm"
sudo ln -s "$DOT_ROOT/modules/042-lightdm/lightdm" "/etc/lightdm"
