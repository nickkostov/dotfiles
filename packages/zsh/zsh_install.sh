#!/usr/bin/env bash

if [[ -n $(command -v zsh) ]]; then 
   echo "zsh has been installed"
else
   sudo apt install zsh
fi