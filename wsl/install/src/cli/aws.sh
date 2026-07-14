if [ -f "/usr/local/bin/aws" ]; then
  echo "AWS CLI is already installed"
  aws --version
else
  echo "Installing AWS CLI"
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
fi

if [ -f "$PWD/awscliv2.zip" ] && [ -d "$PWD/aws" ]; then
  rm awscliv2.zip
  rm -rf aws/
else
  echo "AWS CLI installation files not found, skipping cleanup"
fi
