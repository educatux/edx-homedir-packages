#!/bin/bash
#===============================================================================
#
#          FILE:  open_zotero.sh
#
#         USAGE:  ./open_zotero.sh
#
#   DESCRIPTION:  Autorise l'accès à Zotero (Machine Thorin)
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (),
#       COMPANY:
#       VERSION:  1.0
#       CREATED:  28/04/2013 17:24:32 CEST
#      REVISION:  ---
#===============================================================================

fping thorin.local >/dev/null 2>&1 && {
    echo "Thorin est deja accessible"
    exit 0
}

if [[ $(pgrep firefox) ]]; then
    echo 'Firefox est ouvert - Merci de le fermer et de relancer ce script'
    exit 1
else
    sudo iptables -D OUTPUT -d 192.168.100.25 -j REJECT 2> /dev/null
    touch $HOME/.zotero_open
    sleep 15
    if [[ $(fping thorin.local >/dev/null 2>&1) ]]; then
        exit 0
    else
        sleep 5
        $(fping thorin.local >/dev/null 2>&1) || {
            echo "Visiblement Thorin n'est pas disponible"
            exit 1
        } && exit 0
    fi
fi
