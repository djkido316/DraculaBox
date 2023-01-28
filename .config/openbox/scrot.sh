#!/bin/sh
scrot ~/Pictures/$(date +%s).png && notify-send 'Screenshot taken'
