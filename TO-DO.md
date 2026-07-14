# Features to implement

## SSH Activator based on OS detection

### If WSL:

Function that needs to perform the following:
- Use helper functions.
1. Check os and if wsl perform next:
2. Check if the service file exists: `~/.config/systemd/user/ssh-agent.service`
3. If the file exist do nothing.
4. If it does not add it from a dir in the repo.
5. Start the service: `systemctl --user restart ssh-agent.service`
6. Reload the demon: `systemctl --user daemon-reload`
7. Enable the service: `systemctl --user enable --now ssh-agent.service`

### Think if I need other cases.

## Add helper functions in all the files in order to make sure you can re-use them from everywhere.

###

```bash
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
source "$DOTFILES_DIR/install/lib/helpers.sh"
```

Make an absolute cleanup function:
- Clear history and in memory.
- Clear all codex references from the instance at all times
