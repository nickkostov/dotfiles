mkcd() {
  mkdir -p "$1" && cd "$1"
}

path_add() {
  [[ -d "$1" ]] || return
  [[ ":$PATH:" == *":$1:"* ]] || export PATH="$1:$PATH"
}

reload_dotfiles() {
  local dotfiles_dir="${DOTFILES_DIR:-$HOME/.dotfiles}"
  local zshrc="$HOME/.zshrc"

  if [[ ! -r "$zshrc" ]]; then
    echo "Cannot reload: $zshrc is not readable"
    return 1
  fi

  if [[ -L "$zshrc" ]]; then
    local target
    target="$(readlink "$zshrc")"

    if [[ "$target" != "$dotfiles_dir/shell/zsh/.zshrc" ]]; then
      echo "Warning: ~/.zshrc does not point to this dotfiles repo"
      echo "Current target: $target"
      return 1
    fi
  fi

  if ! zsh -f -c "export DOTFILES_DIR='$dotfiles_dir'; source '$zshrc'"; then
    echo "Reload aborted: zsh config failed validation"
    return 1
  fi

  source "$zshrc"
  echo "Dotfiles reloaded"
}

mamnik() {
  local func_dir="${DOTFILES_DIR:-$HOME/.dotfiles}/private/functions"

  [[ -d "$func_dir" ]] || return 0

  local file
  for file in "$func_dir"/{.,}*.zsh(N.); do
    source "$file"
  done
}

# Annoyed by ssh-agent on Ubuntu WSL adding this and hoping for the best
load_ssh_key() {
  local key=${1:-everest}
  eval $(ssh-agent)
  ssh-add ${HOME}/.ssh/${key}
}
