if [ -d "$HOME/.nvm" ]; then
  echo "NVM (Node Version Manager) is already installed"
else
  echo "Installing NVM (Node Version Manager)"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
  \. "$HOME/.nvm/nvm.sh"
  nvm install 24
  node -v
  npm -v
fi
