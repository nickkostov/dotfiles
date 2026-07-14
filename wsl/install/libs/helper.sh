#!/bin/env bash
set -euo pipefail

DOTFILES_DIR="${DOTFILES_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../../.." && pwd)}"
source "$DOTFILES_DIR/install/lib/helpers.sh"

install() {
  log "Installing software and tools for normal operations"
}

noinstall() {
  log "No installation needed, all software and tools are already installed"
}
