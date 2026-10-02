# OpenChamber Snap

Classic-confined snap for [OpenChamber](https://openchamber.dev), the web
interface for OpenCode. Runs the OpenChamber server with PTY-backed terminal
sessions and a PWA UI.

## Prerequisites

- **OpenCode** must be installed separately. For workshop users, add the
  `opencode` SDK to your `workshop.yaml`. For snap users, install it manually:

  ```bash
  sudo snap install --classic opencode
  ```

## Build

```bash
snapcraft pack -v --use-lxd
```

This produces `openchamber_2.0.3_amd64.snap`.

## Install

```bash
sudo snap install --dangerous ./openchamber_2.0.3_amd64.snap
```

NOTE: The `--dangerous` flag is required because this is a locally built snap, not one
from the Snap Store.

## Verify

```bash
openchamber --version
openchamber --help
```

## Usage

Start a local server (requires OpenCode running):

```bash
openchamber --ui-password your-password-here
```

Install as a systemd user service for automatic startup:

```bash
openchamber startup enable --host 0.0.0.0 --ui-password your-password-here
systemctl --user status openchamber.service
```

## License

MIT — matches the upstream [OpenChamber](https://github.com/openchamber/openchamber) license.
