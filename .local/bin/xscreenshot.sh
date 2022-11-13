#!/bin/bash

err() {
  dunstify "But nothing happened!"
  exit 1
}

MENU="dmenu"
SAVEPATH=~/Pictures/Screenshots
SAVENAME=$(date "+%Y%m%d-%H%M%S").png

OPTIONS=$(echo -e "-Crop\n-Fullscreen" | $MENU -p "Screenshot:")

case $OPTIONS in
	"-Crop") TOKEN="-u -s";;
	"-Fullscreen") TOKEN="-u -d 0.4";;
	*) err ;;
esac

SAVE=$(echo -e "-Clipboard\n-Save" | $MENU)
[ $SAVE ] && maim $TOKEN $SAVEPATH/$SAVENAME \ 
  # && mpv --no-video /usr/share/sounds/freedesktop/stereo/screen-capture.oga

case $SAVE in
	"-Save")
		CHANGE=$(echo -e "No\nYes" | $MENU -p "Change image's name?")
		[ $CHANGE = "Yes" ] && NEW=$(echo -e "" | $MENU -p "New name:")

		if [ $NEW ]
		then
			COUNT=$(ls $SAVEPATH | grep $NEW | wc -l)
			[ $COUNT -gt 0 ] && NEW+=($COUNT).png || NEW+=.png
			mv $SAVEPATH/$SAVENAME $SAVEPATH/$NEW && SAVENAME=$NEW
		fi

    ACTION=$( dunstify "Capture Saved!" "$SAVENAME saved in $SAVEPATH" -i $SAVEPATH/$SAVENAME --action="show, image viewer" --action="list, file manager" )
    case $ACTION in
      show) $TERMINAL -e imv $SAVEPATH/$SAVENAME ;;
      list) $TERMINAL -e lf $SAVEPATH ;;
    esac
    ;;

	"-Clipboard")
    xclip -selection clipboard -t image/png $SAVEPATH/$SAVENAME
		dunstify "Screenshot saved in the clipboard!" -i $SAVEPATH/$SAVENAME
    
    rm $SAVEPATH/$SAVENAME
		;;

	*) err;;
esac
