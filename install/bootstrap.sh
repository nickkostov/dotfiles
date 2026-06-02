#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

log() {
  printf '\033[1;32m[dotfiles]\033[0m %s\n' "$*"
}

warn() {
  printf '\033[1;33m[warning]\033[0m %s\n' "$*"
}

die() {
  printf '\033[1;31m[error]\033[0m %s\n' "$*" >&2
  exit 1
}

detect_os() {
  case "$(uname -s)" in
    Darwin) echo "macos" ;;
    Linux)
      if grep -qi microsoft /proc/version 2>/dev/null; then
        echo "wsl"
      else
        echo "linux"
      fi
      ;;
    *) echo "unknown" ;;
  esac
}

run_if_exists() {
  local script="$1"

  if [[ -x "$script" ]]; then
    log "Running $script"
    "$script"
  elif [[ -f "$script" ]]; then
    log "Running $script"
    bash "$script"
  else
    warn "Skipping missing script: $script"
  fi
}

OS="$(detect_os)"

[[ "$OS" != "unknown" ]] || die "Unsupported OS"

log "Detected OS: $OS"
log "Dotfiles directory: $DOTFILES_DIR"

run_if_exists "$DOTFILES_DIR/install/packages/main.sh"
run_if_exists "$DOTFILES_DIR/os/$OS/install.sh"
run_if_exists "$DOTFILES_DIR/shell/zsh/install.sh"
run_if_exists "$DOTFILES_DIR/git/install.sh"
run_if_exists "$DOTFILES_DIR/vim/install.sh"
run_if_exists "$DOTFILES_DIR/ssh/install.sh"

log "Bootstrap complete"