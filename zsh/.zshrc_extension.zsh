#!/usr/bin/env zsh

# Additional zsh configurations

# Homebrew configuration

if [[ -d /home/linuxbrew/ ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
    echo "Brew Package Manager Activated"
else
    echo "No brew installation"
fi