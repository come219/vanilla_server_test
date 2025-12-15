#!/bin/bash
#
# run_vanilla_server.sh
#

### ==============================
### Environment
### ==============================
# OS: Linux (CentOS)
# Server: Minecraft Vanilla
# Screen session name: mc_server

### ==============================
### Configuration
### ==============================

MC_DIR="/root/vanilla_server_test"
SCREEN_NAME="mc_server"
START_SCRIPT="start_server.sh"

### ==============================
### Start Server
### ==============================

echo "Changing to Minecraft server directory..."
cd "$MC_DIR" || {
  echo "ERROR: Failed to change directory to $MC_DIR"
  exit 1
}

echo "Starting Vanilla Minecraft server in screen session '$SCREEN_NAME'..."

# Start the server in a detached screen session
screen -dmS "$SCREEN_NAME" bash "$START_SCRIPT"

# Give screen a moment to initialize
sleep 1

# Verify screen session started
SCREEN_ID=$(screen -ls | grep "$SCREEN_NAME" | awk '{print $1}')

if [ -n "$SCREEN_ID" ]; then
  echo "Vanilla Minecraft server started successfully."
  echo "Screen session ID: $SCREEN_ID"
  echo
  echo "Attach with:"
  echo "  screen -r $SCREEN_NAME"
else
  echo "ERROR: Failed to start screen session."
  exit 1
fi

