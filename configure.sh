#!/usr/bin/env sh

current_path=$(pwd)

configure_aliases_bash() {
  echo ". $current_path/.aliases" >> $HOME/.bashrc
  [[ -f "$current_path/.aliases" ]] && echo ". $current_path/.aliases" >> $HOME/.zshrc_extension.zsh
}
configure_aliases
