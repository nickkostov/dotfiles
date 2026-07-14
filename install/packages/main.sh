#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
LIB_DIR="$DOTFILES_DIR/install/lib"
source "$LIB_DIR/helpers.sh"

if is_installed starship; then
   log "Starship is already installed"
else
  curl -sS https://starship.rs/install.sh | sh
fi
