export DOTFILES_DIR="${DOTFILES_DIR:-$HOME/.dotfiles}"

[[ -d "$HOME/.local/bin" ]] && path=("$HOME/.local/bin" $path)

if [[ "$OSTYPE" == darwin* ]]; then
  [[ -d /opt/homebrew/bin ]] && path=(/opt/homebrew/bin $path)
  [[ -d /usr/local/bin ]] && path=(/usr/local/bin $path)
fi

[[ -d /home/linuxbrew/.linuxbrew/bin ]] && path=(/home/linuxbrew/.linuxbrew/bin $path)

export PATH
