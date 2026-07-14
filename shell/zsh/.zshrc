export DOTFILES_DIR="$HOME/.dotfiles"
export ZSH_CONFIG_DIR="$DOTFILES_DIR/shell/zsh/"

source_if_readable() {
  # Parameter expansion with default value to ensure the file is not empty (not really needed but cool to show off)
  local file="${1:-}"
  # Check if the file variable is not empty and the file is readable before sourcing it.
  [[ -n "$file" && -r "$file" ]] && source "$file"
}

source_if_readable "$DOTFILES_DIR/install/lib/helpers.sh"

source_if_readable "$ZSH_CONFIG_DIR/exports.zsh"
source_if_readable "$ZSH_CONFIG_DIR/history.zsh"
source_if_readable "$ZSH_CONFIG_DIR/completion.zsh"
source_if_readable "$ZSH_CONFIG_DIR/keybindings.zsh"
source_if_readable "$ZSH_CONFIG_DIR/../common/.aliases"
source_if_readable "$ZSH_CONFIG_DIR/functions.zsh"
source_if_readable "$ZSH_CONFIG_DIR/prompt.zsh"

# Checks if function exists before trying to run it.
#if typeset -f run_if_exists >/dev/null; then
#  run_if_exists "$DOTFILES_DIR/ssh/ssh-agent/cycle.sh"
#fi

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
