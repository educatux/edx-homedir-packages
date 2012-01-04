alias tree="tree -ugpN"
alias tmux="tmux -2"
alias tm="tmux -2"
alias tma="tmux attach"
alias tmlk="tmux list-keys"
alias tmls="tmux list-keys"
alias tms="tmux-shared"
alias mcabber="mcabber 2> /dev/null"
# alias vlc="vlc ~/Vidéos/et9000-csat.m3u"
alias chrome="/usr/bin/google-chrome --proxy-server=isildur:8118"

DOTFILES="/srv/repositories/git/github.com/educatux/edx-config/user.configfiles"

function mcabber-counts {
    for f in ~/.mcabber/history/*; do
        a=`egrep "^(MR|MS)" $f | wc -l`; echo $f: $a | awk -F\/ '{print $6}'
    done
}


function gen_tdm {
    echo "CD_DA"

    # pour chaque argument
    for i in "$@"; do

        echo "";
        echo "TRACK AUDIO";
        echo "AUDIOFILE \"$i\" 0";
    done
}

alias cdextract="cdparanoia --batch --output-wav"
alias cdaudio="cdrdao write --eject --device /dev/cdrom --driver generic-mmc-raw cd.toc"

alias syslog="sudo tail -f /var/log/syslog | ccze"
alias updatedb="sudo updatedb"
alias topten='du -sk $(/bin/ls -A) | sort -rn | head -10'
alias cal='var=$(/usr/bin/cal -m); echo "${var/$(date +%-d)/$(echo -e "\033[1;31m$(date +%-d)\033[0m")}"'
alias mc="mc --colors directory=brightblue,default:normal=lightgray,default:executable=brightgreen,default:selected=yellow,blue:marked=yellow,default:markselect=gray,blue:link=brightmagenta,default:stalelink=brightred,default:core=red,default:device=green,default:special=red,default:errors=white,red:reverse=yellow,red:gauge=red,blue:input=brightblue,black:dnormal=yellow,default:dfocus=yellow,blue:dhotnormal=yellow,blue:dhotfocus=yellow,red:menu=brightblue,default:menusel=yellow,red:menuhot=yellow,default:menuhotsel=yellow,red:helpnormal=blue,black:helpitalic=red,black:helpbold=yellow,black:helplink=black,blue:helpslink=yellow,blue:viewunderline=brightred,default:editnormal=lightgrey,default:editbold=yellow,default:editmarked=brightblue,default"

# alias gandalf="Xephyr :5 -host-cursor -dpi 96 -ac  -wr -s 120 -screen 1600x1200 +kb -keybd ephyr,xkblayout=fr,xkbmodel=evdev,xkbvariant=oss -query gandalf.educatux.org"
alias root="sudo -i"
alias notes="/usr/bin/vim.gtk -g --remote-tab-silent /srv/users/stephane/NOTES"

## Gestion du Démarrage de Gandalf
alias gandalf_on="ipmipower -h 172.31.14.220 -u admin -p linux -n"
alias gandalf_off="ipmipower -h 172.31.14.220 -u admin -p linux -f"

alias grima="rdesktop -xl -k fr -a 32 -f -r sound:local grima -u stephane"
alias pippin="rdesktop -xl -k fr -a 32 -f -r sound:local pippin -u stephane"

## Affiche le nombre de dpi du Serveur X
alias dpi="xdpyinfo | grep 'dots per inch'"

alias s="~/.bin/sync-unison"
alias bckstop="sudo touch /var/run/edx-nostop"
alias audio-converter="/srv/mounts/galadriel/shares/.bin/audio-converter.sh"
alias rubybox="sudo schroot -c rubybox"
alias multiplication="seq 9 | sed 'H;g' | awk -v RS='' '{for(i=1;i<=NF;i++)printf(\"%dx%d=%d%s\", i, NR, i*NR, i==NR?\"\n\":\"\t\")}'"
alias myipaddress="dig +short myip.opendns.com @resolver1.opendns.com 2> /dev/null"
# alias delete_zero_files="find -size 0 -exec rm -f {} \;"

## Source Local Aliases
source ~/.bash_aliases_${HOSTNAME}
