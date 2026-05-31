#!/usr/bin/env bash

current_path=$(pwd)

configure_aliases() {
  echo ". $current_path/.aliases" >> $HOME/.bashrc
}

configure_aliases