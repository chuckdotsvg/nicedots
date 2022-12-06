#!/bin/bash

MENU="wofi"
SAVEPATH=~/Pictures/Screenshots
SAVENAME=$(date "+%Y%m%d-%H%M%S").png

OPTIONS=$(echo -e "-Crop\n-Fullscreen" | $MENU -p "Screenshot:")

case $OPTIONS in
	"-Crop") TOKEN=1;;
	"-Fullscreen") TOKEN=0;;
	*)
		dunstify "Invalid entry!"
		exit 1 
		;;
esac

SAVE=$(echo -e "-Clipboard\n-Save" | $MENU)
if [ $SAVE ]
then
		[ $TOKEN -eq 1 ] && slurp | grim -g - $SAVEPATH/$SAVENAME
		[ $TOKEN -eq 0 ] && sleep 1 && grim $SAVEPATH/$SAVENAME
fi


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

		# dunstify "$SAVENAME saved in $SAVEPATH" -i $SAVEPATH/$SAVENAME
    ACTION=$( dunstify "Capture Saved!" "$SAVENAME saved in $SAVEPATH" -i $SAVEPATH/$SAVENAME --action="show, image viewer" --action="list, file manager" )
    case $ACTION in
      show) $TERMINAL -e imv $SAVEPATH/$SAVENAME ;;
      list) $TERMINAL -e lf $SAVEPATH ;;
    esac
		;;
	"-Clipboard")
    wl-copy < $SAVEPATH/$SAVENAME
		dunstify "Screenshot saved in the clipboard!" -i $SAVEPATH/$SAVENAME

    rm $SAVEPATH/$SAVENAME
		;;
	*)
		dunstify "Invalid entry!"
		exit 1 
		;;
esac
