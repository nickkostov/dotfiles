if command -v starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG="$DOTFILES_DIR/shell/zsh/starship/starship.toml"
  eval "$(starship init zsh)"
else
  PROMPT='%F{green}%n@%m%f:%F{blue}%~%f %# '
fi