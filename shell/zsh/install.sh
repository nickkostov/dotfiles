#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
ZSH_DIR="$DOTFILES_DIR/shell/zsh"

echo "Configuring zsh..."

link_file() {
    local source="$1"
    local target="$2"

    if [[ ! -e "$source" ]]; then
        echo "Missing source: $source" >&2
        exit 1
    fi

    mkdir -p "$(dirname "$target")"

    if [[ -L "$target" ]]; then
        rm "$target"
    elif [[ -e "$target" ]]; then
        local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        mv "$target" "$backup"
        echo "Backed up $target -> $backup"
    fi

    ln -s "$source" "$target"
    echo "Linked $target -> $source"
}

link_file "$ZSH_DIR/.zshrc" "$HOME/.zshrc"
link_file "$ZSH_DIR/.zprofile" "$HOME/.zprofile"

if [[ -f "$ZSH_DIR/starship/starship.toml" ]]; then
    link_file "$ZSH_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
fi

echo "Zsh configuration installed."