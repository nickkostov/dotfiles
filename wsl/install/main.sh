#!/usr/bin/env bash


if [ -f "check/check_os.sh" ]; then
  echo "Found OS check script, sourcing it to ensure OS is supported for installation"
  source check/check_os.sh
else
  echo "OS check script is missing. Please ensure OS is supported for installation before proceeding."
  exit 1
fi

os_check

if [ -f "src/atx/atx.sh" ]; then
  echo "Found installation script for ATX, sourcing it to ensure ATX is installed and available"
  source src/atx/atx.sh

else
  echo "ATX installation script is missing. Please ensure ATX installation script is available before proceeding."
  exit 1
fi
