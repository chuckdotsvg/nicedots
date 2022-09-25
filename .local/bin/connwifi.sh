#!/bin/bash

MENU="dmenu"
PP="dmenu -P"

err(){
  dunstify "But nothing happened!"
  exit 1
}

check () { test $1 || err ;}

password () {
  PW=$($MENU -P -p "Password:")

  check $PW
}

oldnet () {
  SAVED=$(wpa_cli list_networks | tail -n +3 | sed 's/any.*//' | \
    sed 's/.$//' | $MENU -p "Select Network:")
  
  check $SAVED 
  OPT=$(echo -e "Connect\nChange Password\nDelete" | dmenu -R -p "$SAVED")

  case $OPT in
    Connect) ;;
    "Change Password") password ;;
    Delete) ;;
  esac

}

newnet () {
  dunstify "usuck"
}

mainmenu () {
  MM=$(echo -e "New Network\nSaved Networks" | $MENU -R -p "Select an option:")
  
  check $MM
  
  [[ $MM == "New Network" ]] && newnet || oldnet
}

mainmenu
