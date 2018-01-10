#!/bin/bash

# Remove orphaned packages with cascade mode
pacman -Rnsc $(pacman -Qdtq)

# Clean downloaded packages
pacman -Sc --noconfirm

# Defrag pacman database. Do not run this if using an SSD!
# pacman-optimize && sync
