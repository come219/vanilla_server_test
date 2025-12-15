#!/bin/bash

echo "=============================="
echo " Starting Java Server"
echo "=============================="
echo
echo "Command:"
echo "java -Xmx1024M -Xms1024M -jar server.jar nogui"
echo

# --------------------------------------------------
# High-performance / production setup (COMMENTED)
#
# java -Xms1G -Xmx1G \
# -XX:+UseG1GC \
# -XX:+ParallelRefProcEnabled \
# -XX:MaxGCPauseMillis=200 \
# -XX:+UnlockExperimentalVMOptions \
# -XX:+DisableExplicitGC \
# -jar server.jar nogui
# --------------------------------------------------

echo "Launching server..."
echo

java -Xmx1024M -Xms1024M -jar server.jar nogui

echo
echo "Server stopped."
