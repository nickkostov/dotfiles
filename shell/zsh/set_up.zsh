#!/bin/zsh


# One way of working with this is by using an array
# declare -a ZSH_CONFIGS=(.zshrc .zsh_history_config.zsh .zshrc_extension.zsh)
# Another (ai suggested)
ZSH_CONFIGS=(.[^.]*)

for file in "${ZSH_CONFIGS[@]}"
do
  print -P "%F{blue}Configuring the zsh environment with $file%f"
  cp -v "$file" ~/
done

print -P "%F{green}Reloading Configuration%f"
source ~/.zshrc