#!/usr/bin/env bash
set -euo pipefail

# Smoke test for the openchamber snap.
# If no snap file is found, scan the current directory and snap-openchamber/.
SNAP_FILE="${1:-}"
if [ -z "$SNAP_FILE" ]; then
  # Try current directory first, then snap-openchamber/ build output
  SNAP_FILE=$(ls openchamber_*.snap 2>/dev/null | head -1) || true
  if [ -z "$SNAP_FILE" ]; then
    SNAP_FILE=$(ls snap-openchamber/openchamber_*.snap 2>/dev/null | head -1) || true
  fi
  if [ -z "$SNAP_FILE" ]; then
    echo "ERROR: No openchamber_*.snap found. Build it first with: snapcraft pack"
    exit 1
  fi
fi

echo "==> Installing openchamber snap (--classic --dangerous)"
sudo snap install --classic --dangerous "$SNAP_FILE"

echo "==> Checking openchamber --version"
openchamber --version

echo "==> Checking openchamber --help"
openchamber --help > /dev/null

echo "==> Smoke test passed"
echo "==> Cleaning up"
sudo snap remove openchamber