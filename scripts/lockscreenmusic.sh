#!/bin/bash

function handle(){
    read -ra arr <<< "$1"
    echo "${arr[@]}"

    # check if is album art is local or online
    if [[ "${arr[2]}" =~ http[s]?:\/\/.* ]] ; then
        curl "${arr[2]}" > /tmp/coverart
    elif [[ "${arr[2]}" =~ file:///.* ]]; then
        mypath="${arr[2]#file://}"
        ln -s "$mypath" /tmp/coverart
    else
        mypath="${arr[2]#/local/}"
        mypath="$XDG_DATA_HOME"/mopidy/local/images/"$mypath"
        ln -s "$mypath" /tmp/coverart
    fi

    case "${arr[1]}" in
        "spotify")
            ;;
        "mopidy|mpd")
            ;;
        *)
            ;;
    esac
}

playerctl metadata -F | awk '/artUrl/ {print $1, $3}' | while read -r line
do
    echo "$line"
    handle "$line"
done
