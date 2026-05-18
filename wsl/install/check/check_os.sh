#!/usr/bin/env bash

set -euo pipefail


echo "Checking if OS is supported for Configurator"
if [ -f "/etc/os-release" ]; then
  . /etc/os-release
  if [[ "$ID" == "ubuntu" ]]; then
    echo "Ubuntu is supported"
    exit 0
  else
    echo "Unsupported OS: $ID"
    exit 1
  fi
else
  echo "/etc/os-release not found, unable to determine OS"
  exit 1
fi

