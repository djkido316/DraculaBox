#!/bin/sh
if ! mpc >/dev/null 2>&1; then
   echo Server Offline
   exit 1
elif mpc status | grep -q playing; then
(mpc current | zscroll --before-text "" --delay 0.3 \
		--match-command "mpc status" \
		--match-text "playing" "--before-text '' --scroll 1" \
		--match-text "paused" "--before-text ' ' --scroll 0" \
		--match-text "stopped" "--before-text ' '" \
		--length 15 \
		--update-check true "mpc current" ) &
else 
 (echo "") &
 fi
# Block until an event is emitted
mpc idle >/dev/null
