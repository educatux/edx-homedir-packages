#!/bin/bash
#===============================================================================
#
#          FILE:  xdg-sync.sh
#
#         USAGE:  ./xdg-sync.sh
#
#   DESCRIPTION:  Synchronisation des Répertoire XDG
#
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (),
#       COMPANY:
#       VERSION:  1.0
#       CREATED:  02/02/2013 12:24:19 CET
#      REVISION:  ---
#===============================================================================

DIR=$(pwd)

cd $HOME

for i in documents images modeles musique public videos ; do
    unison -batch ${i}
done

cd $DIR
