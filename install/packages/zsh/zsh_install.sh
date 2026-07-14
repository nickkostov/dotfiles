#!/usr/bin/env bash
set -euo pipefail

if command -v zsh >/dev/null 2>&1; then
    echo "zsh already installed"
    exit 0
fi

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y zsh
elif command -v brew >/dev/null 2>&1; then
    brew install zsh
else
    echo "Unsupported package manager"
    exit 1
fi
