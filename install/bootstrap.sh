#!/usr/bin/env bash
set -euo pipefail

# One of the most OP ways to get absolute path of the script's directory
# https://stackoverflow.com/a/246128/1233763

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DOTFILES_DIR/install/lib/helpers.sh"

OS="$(detect_os)"

[[ "$OS" != "unknown" ]] || die "Unsupported OS"

log "Detected OS: $OS"
log "Dotfiles directory: $DOTFILES_DIR"

run_if_exists "$DOTFILES_DIR/install/packages/main.sh"
run_if_exists "$DOTFILES_DIR/os/$OS/install.sh"
run_if_exists "$DOTFILES_DIR/shell/common/.aliases"
run_if_exists "$DOTFILES_DIR/shell/zsh/install.sh"
run_if_exists "$DOTFILES_DIR/git/install.sh"
run_if_exists "$DOTFILES_DIR/vim/install.sh"
run_if_exists "$DOTFILES_DIR/ssh/install.sh"

log "Bootstrap complete"

if [[ -n "${ZSH_VERSION:-}" ]]; then
    echo "Reloading zsh configuration..."
    source "$HOME/.zshrc"
else
    echo
    echo "Run 'exec zsh' to reload your shell."
fi
