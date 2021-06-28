#!/usr/bin/env bash
source $DOT_ROOT/constants.sh
DOT_MODULE="sddm"

log info setting sddm configs

log silly "copying sugar candy theme"
sudo rm -rf "/usr/share/sddm/themes/sugar-candy"
sudo cp -r "$DOT_ROOT/modules/042-sddm/sugar-candy" "/usr/share/sddm/themes/"

log silly "linking /etc/sddm.conf"
sudo rm -rf "/etc/sddm.conf"
sudo ln -s "$DOT_ROOT/modules/042-sddm/sddm.conf" "/etc/sddm.conf"

log silly "linking /etc/sddm.conf.d"
sudo rm -rf "/etc/sddm.conf.d"
sudo ln -s "$DOT_ROOT/modules/042-sddm/sddm.conf.d" "/etc/sddm.conf.d"
