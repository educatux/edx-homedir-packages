#!/bin/bash
#===============================================================================
#
#          FILE:  open_zotero.sh
#
#         USAGE:  ./open_zotero.sh
#
#   DESCRIPTION:  Interdit l'accès à Zotero (Machine Thorin)
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

fping thorin.local >/dev/null 2>&1 || {
    echo 'Thorin est deja inaccessible'
    exit 0
}

if [[ $(pgrep firefox) ]]; then
    echo 'Firefox est ouvert - Merci de le fermer et de relancer ce script'
    exit 1
else
    echo -n 'ATTENTION: Je coupe autofs ...'
    sleep 15
    echo ' Trop tard.'
    sudo /etc/init.d/autofs stop > /dev/null 2>&1
    sleep 15
    sudo iptables -A OUTPUT -d 192.168.100.25 -j REJECT 2> /dev/null
    rm -f $HOME/.zotero_open && touch $HOME/.zotero_no_open
    sleep 15
    if [[ $(fping thorin.local >/dev/null 2>&1) ]]; then
        echo "Visiblement Thorin est disponible"
        exit 1
    else
        sudo /etc/init.d/autofs start > /dev/null 2>&1
        exit 0
    fi
fi
