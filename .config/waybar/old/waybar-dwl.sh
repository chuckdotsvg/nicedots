#!/usr/bin/env bash

# Variables
declare output title layout activetags selectedtags
declare -a tags name
readonly fname="$HOME"/.cache/dwltags
tags=( "1" "2" "3" "4" "5" )
name=( "I" "II" "III" "IV" "V" ) # Array of labels for tags
monitor="${1}"
component="${2}"
_cycle() {
    case "${component}" in
	# I only use six tags; if you use more, expand this array appropriately
	[01234])
	    this_tag="${component}"
	    unset this_status
	    mask=$((1<<this_tag))
	    if (( "${activetags}"   & mask )) 2>/dev/null; then this_status+='"active",'  ; fi
	    if (( "${selectedtags}" & mask )) 2>/dev/null; then this_status+='"selected",'; fi
	    if (( "${urgenttags}"   & mask )) 2>/dev/null; then this_status+='"urgent",'  ; fi
	    if [[ "${this_status}" ]]; then
		printf -- '{"text":" %s ","class":[%s]}\n' "${name[this_tag]}" "${this_status}"
	    else
		printf -- '{"text":" %s "}\n' "${name[this_tag]}"
	    fi
	    ;;
	layout)
	    printf -- '{"text":"  %s  "}\n' "${layout}"
	    ;;
	title)
	    printf -- '{"text":"%s"}\n' "${title}"
	    ;;
	*)
	    printf -- '{"text":"INVALID INPUT"}\n'
	    ;;
    esac
}
while [[ -n "$(pgrep waybar)" ]] ; do
    [[ ! -f "${fname}" ]] && printf -- '%s\n' \
				    "You need to redirect dwl stdout to ~/.cache/dwltags" >&2
    # Get info from the file
    output="$(grep  "${monitor}" "${fname}" | tail -n6)"
    title="$(echo   "${output}" | grep '^[[:graph:]]* title'  | cut -d ' ' -f 3-  | sed s/\"/“/g )" # Replace quotes - prevent waybar crash
    layout="$(echo  "${output}" | grep '^[[:graph:]]* layout' | cut -d ' ' -f 3- )"
    #selmon="$(echo "${output}" | grep 'selmon')"
    # Get the tag bit mask as a decimal
    activetags="$(echo "${output}"   | grep '^[[:graph:]]* tags' | awk '{print $3}')"
    selectedtags="$(echo "${output}" | grep '^[[:graph:]]* tags' | awk '{print $4}')"
    urgenttags="$(echo "${output}"   | grep '^[[:graph:]]* tags' | awk '{print $6}')"
    _cycle
    # 60-second timeout keeps this from becoming a zombified process when waybar is no longer running
    inotifywait -t 60 -qq --event modify "${fname}"
done
unset -v activetags layout name output selectedtags tags title

