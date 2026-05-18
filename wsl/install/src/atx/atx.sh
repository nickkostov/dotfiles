#!/usr/bin/env bash

set -euo pipefail


PWD=$(pwd)

if [ -f "libs/helper.sh" ]; then
  echo "Found installation script for helper functions, sourcing it to ensure helper functions are available"
  source libs/helper.sh
else
  echo "Helper script is missing. Please ensure helper functions are available before installing ATX."
  exit 1
fi

if [ -f "src/nvm/nvm.sh" ]; then
  echo "Found installation script for NVM, sourcing it to ensure NVM is installed and available"
  source src/nvm/nvm.sh
else
  echo "NVM script is mssing. Please install NVM first before installing ATX."
  exit 1
fi

if [ -f "src/cli/aws.sh" ]; then
  echo "Found installation script for AWS CLI, sourcing it to ensure AWS CLI is installed and available"
  source src/cli/aws.sh
else
  echo "AWS CLI script is missing. Please install AWS CLI first before installing ATX."
  exit 1
fi


atx_install() {
if [ -f "$HOME/.local/bin/atx" ]; then
  echo "ATX (AWS Transform CLI is already installed)"
  exit 0
  install=true
  noinstall
else
  install
  curl -fsSL https://transform-cli.awsstatic.com/install.sh | bash
fi

if [[ "$install" == true ]]; then
  echo "No need to reload shell as ATX was already installed"
else
  echo "Reloading shell to make ATX available"
  if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
    echo "Detected bash shell and reloading .bashrc"
    bash -c "source ~/.bashrc"
  else
    echo "Detected zsh shell and reloading .zshrc"
    zsh -c "source ~/.zshrc"
  fi
fi
}
