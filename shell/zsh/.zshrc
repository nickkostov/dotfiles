# Key bindings
bindkey -e

# Ctrl+Left / Ctrl+Right word movement
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[5C' forward-word
bindkey '^[[5D' backward-word

# Completion
autoload -Uz compinit
compinit

# Colors (only if available)
(( $+commands[dircolors] )) && eval "$(dircolors -b)"

# Better completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Starship prompt
eval "$(starship init zsh)"
# Load History Config


[[ -f "$HOME/.zsh_history_config.zsh" ]] && . "$HOME/.zsh_history_config.zsh"
[[ -f "$HOME/.zshrc_extension.zsh" ]] && . "$HOME/.zshrc_extension.zsh"
