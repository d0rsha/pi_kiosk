#!/bin/bash

X="$(fbset -s | grep -o '".*x.*"' | sed 's/"//g' | sed 's/x/\'$'\n/g' | sed -n 1p)"
Y="$(fbset -s | grep -o '".*x.*"' | sed 's/"//g' | sed 's/x/\'$'\n/g' | sed -n 2p)"
echo "Screen resolution: $X x $Y"

X1=$(expr $X / 2 - 150)
X2=$(expr $X / 2 + 150)
Y1=$(expr $Y / 2 - 75)
Y2=$(expr $Y / 2 + 75)

echo "Running command: FBpyGIF /home/pi/Pictures/spinner/ -sd 0.5 -w $X1,$Y1,$X2,$Y2"
FBpyGIF /home/pi/Pictures/spinner -sd 0.5 -w $X1,$Y1,$X2,$Y2