#!/bin/bash
#
# run_vanilla_server.sh
# Vanilla Minecraft server with auto-restart
#

### ==============================
### Configuration
### ==============================

MC_DIR="/root/sebi/minecraft_server/new_mc_server2025"
SCREEN_NAME="mc_server"
START_SCRIPT="start_server.sh"
RESTART_DELAY=5   # seconds before restart

### ==============================
### Safety Checks
### ==============================

if ! command -v screen >/dev/null 2>&1; then
  echo "ERROR: screen is not installed."
  exit 1
fi

if [ ! -d "$MC_DIR" ]; then
  echo "ERROR: Minecraft directory not found: $MC_DIR"
  exit 1
fi

### ==============================
### Start Screen Session
### ==============================

# Prevent duplicate screen sessions
if screen -ls | grep -q "$SCREEN_NAME"; then
  echo "ERROR: Screen session '$SCREEN_NAME' already exists."
  echo "Attach with: screen -r $SCREEN_NAME"
  exit 1
fi

echo "Starting Vanilla Minecraft server (auto-restart enabled)..."

screen -dmS "$SCREEN_NAME" bash -c "
  cd \"$MC_DIR\" || exit 1

  while true; do
    echo \"==================================\"
    echo \"Starting Minecraft server...\"
    echo \"Time: \$(date)\"
    echo \"==================================\"

    bash \"$START_SCRIPT\"

    echo \"----------------------------------\"
    echo \"Server stopped or crashed.\"
    echo \"Restarting in $RESTART_DELAY seconds...\"
    echo \"Time: \$(date)\"
    echo \"----------------------------------\"

    sleep $RESTART_DELAY
  done
"

sleep 1

SCREEN_ID=\$(screen -ls | grep \"$SCREEN_NAME\" | awk '{print \$1}')

if [ -n \"\$SCREEN_ID\" ]; then
  echo \"Minecraft server started successfully.\"
  echo \"Screen session: \$SCREEN_NAME\"
  echo
  echo \"Attach with:\"
  echo \"  screen -r $SCREEN_NAME\"
else
  echo \"ERROR: Failed to start Minecraft server.\"
  exit 1
fi
