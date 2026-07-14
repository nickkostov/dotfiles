autoload -Uz compinit

ZSH_COMPDUMP="${ZSH_COMPDUMP:-$HOME/.zcompdump}"

if [[ ! -f "$ZSH_COMPDUMP" || "$ZSH_COMPDUMP" -ot "$HOME/.zshrc" ]]; then
  compinit -d "$ZSH_COMPDUMP"
else
  compinit -C -d "$ZSH_COMPDUMP"
fi

(( $+commands[dircolors] )) && eval "$(dircolors -b)"

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

zstyle ':completion:*:*:*:*:globbed-files' ignored-patterns \
  '*/node_modules/*' \
  '*/.git/*' \
  '*/.cache/*' \
  '*/target/*' \
  '*/dist/*' \
  '*/build/*' \
  '*/vendor/*'

zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompcache"

zstyle ':completion:*' ignored-patterns '*.dll, *.exe'
zstyle ':fzf-tab:complete:*' fzf-flags --walker-skip='*.dll,*.exe,*.pdb,/mnt/c,/mnt/d'
