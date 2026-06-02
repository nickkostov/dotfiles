#!/usr/bin/env zsh

# Additional zsh configurations

# Homebrew configuration

# Homebrew configuration:
if [[ -d /home/linuxbrew/ ]]; then
    eval "$(/usr/local/bin/brew shellenv)" 2>/dev/null
    echo "Brew Package Manager Activated"
    exit 1
elif [[ -d /home/linuxbrew/.linuxbrew/ ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    echo "Brew Package Manager Activated"
else
    echo "No brew installation"
fi
