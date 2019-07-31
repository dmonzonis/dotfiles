#!/bin/bash

# Try to use a pacman wrapper if possible
MANAGER=pacman
if [ -x "$(command -v yay)" ]; then
    MANAGER=yay
elif [ -x "$(command -v pacaur)" ]; then
    MANAGER=pacaur
fi

echo "Package manager found: $MANAGER"

# Remove orphaned packages with cascade mode
$MANAGER -Rnsc $($MANAGER -Qdtq)

# Clean downloaded packages
$MANAGER -Sc --noconfirm
