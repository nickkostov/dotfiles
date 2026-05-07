# Using a Service file

This solution is the cleanest form that you can use in order to configure your SSH-AGENT.
It is applicable for WSL only most machines that have

The idea is to create a small service file that would handle the agent enablement and working operations.

## Prerequisites

In order for this to work you need to enable systemd in wsl. To enable:

1. Edit the wsl file that is located in etc.

`vim /etc/wsl.conf`

2. Add this to the configuration file:

```ini
[boot]
systemd=true
```

3. Systemctl command to start it:

`systemctl --user enable ssh-agent`
`systemctl --user start ssh-agent`

(This is supported from 2022 in WSL version 2)
