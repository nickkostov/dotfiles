#!/usr/bin/env bash

current_path=$(pwd)

configure_aliases_bash() {
  echo ". $current_path/.aliases" >> $HOME/.bashrc
}

configure_aliases_zsh() {
  echo ". $current_path/.aliases" >> $HOME/.zshrc
}

configure_aliases_bash
configure_aliases_zsh