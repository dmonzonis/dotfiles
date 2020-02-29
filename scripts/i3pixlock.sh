#!/bin/bash
scrot /tmp/screen.png
convert /tmp/screen.png -scale 5% -scale 2000% /tmp/screen.png
i3lock -i /tmp/screen.png
rm /tmp/screen.png
