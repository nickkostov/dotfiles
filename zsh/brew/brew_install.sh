#!/bin/bash

if [ -n $(command -v brew) ]; then
  echo "Homebrew is already installed."
else
  echo "Homebrew is not installed. Installing Homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> /Users/${USER}/.zprofile
  echo 'eval "$(/usr/local/bin/brew shellenv)"' >> /Users/${USER}/.zprofile
  eval "$(/usr/local/bin/brew shellenv)"
fi
