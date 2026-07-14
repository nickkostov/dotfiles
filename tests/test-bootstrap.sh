#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TEST_HOME="$(mktemp -d)"

echo "Repo: $REPO_DIR"
echo "Test HOME: $TEST_HOME"

export HOME="$TEST_HOME"
export DOTFILES_DIR="$REPO_DIR"

bash "$REPO_DIR/configure.sh"

echo
echo "Checking zsh links..."

test -L "$HOME/.zshrc"
test -L "$HOME/.zprofile"
test -L "$HOME/.config/starship.toml"

echo "Checking zsh config loads..."

zsh -f -c "
  export DOTFILES_DIR='$REPO_DIR'
  source '$HOME/.zshrc'
"

echo
echo "Bootstrap test passed."
