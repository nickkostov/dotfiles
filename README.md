# Dotfiles

Personal dotfiles for Linux, WSL and macOS.

## Installation

Clone the repository:

```bash
git clone <repository-url> ~/.dotfiles
```

Run the setup:

```bash
cd ~/.dotfiles
./configure.sh
```

## Updating

```bash
cd ~/.dotfiles
git pull
./configure.sh
```

## Testing

Build the Docker image:

```bash
docker build -t dotfiles-test .
```

Run an interactive container:

```bash
docker run --rm -it dotfiles-test
```

Inside the container:

```bash
./configure.sh
exec zsh
```

## Structure

* `install/` - bootstrap and installation scripts
* `packages/` - package installation
* `shell/` - shell configuration
* `ssh/` - SSH configuration
* `wsl/` - WSL-specific configuration
* `os/` - OS-specific setup

## Requirements

* Git
* Bash
* Linux, WSL, or macOS
