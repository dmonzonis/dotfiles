#!/bin/bash

# Remove orphaned packages with cascade mode
pacman -Rnsc $(pacman -Qdtq)

# Clean downloaded packages
pacman -Sc --noconfirm
