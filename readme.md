#Minecraft server properties

VANILLA minceraft server

version: 1.21.11

no world to start, or delete world or copy world_backup or world_minigames

bash server_run.sh

or

.exe file - but needs updating

server.jar

RAM 1

TARGET 1.5 - 2

SWAP 1-2 GB

DIGIAL OCEAN

IP: 174.128.172.184:25565

london


# Vanilla Minecraft Server – Installation & Start Guide

This guide explains how to install **Java**, **screen**, and start a **Vanilla Minecraft server** using the provided auto-restart script on a Linux (CentOS/RHEL-compatible) system.

---

## 📦 Requirements

* Linux server (CentOS / RHEL / Rocky / Alma / similar)
* Root or sudo access
* Internet access for initial installation
* Basic terminal knowledge

---

## ☕ Install Java

Minecraft Vanilla requires Java. Use **Java 17** for modern versions.

### Install OpenJDK 17

```bash
sudo yum install -y java-17-openjdk
```

### Verify installation

```bash
java -version
```

Expected output should mention **Java 17**.

---

## 🖥️ Install `screen`

`screen` is used to keep the server running in the background.

```bash
sudo yum install -y screen
```

Verify:

```bash
screen --version
```

---

## 📁 Server Directory Structure

Example layout:

```text
/root/sebi/minecraft_server/new_mc_server2025/
├── server.jar
├── start_server.sh
├── run_vanilla_server.sh
└── logs/
```

---

## ▶️ `start_server.sh`

This script runs the Vanilla Minecraft server.

Example:

```bash
#!/bin/bash
java -Xms1024M -Xmx1024M -jar server.jar nogui
```

Make it executable:

```bash
chmod +x start_server.sh
```

---

## 🔁 `run_vanilla_server.sh` (Auto-Restart Launcher)

This script:

* Runs the server inside a `screen` session
* Automatically restarts the server if it crashes or stops
* Prevents duplicate sessions

Make it executable:

```bash
chmod +x run_vanilla_server.sh
```

---

## 🚀 Start the Server

From the server directory:

```bash
./run_vanilla_server.sh
```

If successful, you will see confirmation output and a screen session will start.

---

## 📺 Attach to the Server Console

```bash
screen -r mc_server
```

### Detach without stopping the server

```
Ctrl + A, then D
```

---

## 🛑 Stop the Server Properly

1. Attach to screen:

   ```bash
   screen -r mc_server
   ```
2. Stop Minecraft:

   ```text
   stop
   ```
3. Exit the auto-restart loop:

   ```text
   Ctrl + C
   exit
   ```

Or force stop from outside:

```bash
screen -S mc_server -X quit
```

---

## 🔧 Common Commands

List screen sessions:

```bash
screen -ls
```

Kill stuck session:

```bash
screen -S mc_server -X quit
```

Check Java path:

```bash
which java
```

---

## 📝 Notes

* Server will **automatically restart** if it crashes
* Logs are handled by Minecraft itself (`logs/` directory)
* Recommended RAM: **at least 2GB** for production servers

---

## ✅ Setup Complete

Your Vanilla Minecraft server is now installed, runnable, and protected with auto-restart.

Happy hostin










# ++++++++++++++++



Minecraft Server Setup on Rocky Linux

This guide explains how to configure a low-RAM Rocky Linux server for running a Minecraft server (vanilla, Paper, or CraftBukkit). It covers swap space, Java installation, and server scripts.

1. System Requirements

RAM: 768 MB minimum (more is better)

Disk Space: Minimum 5 GB free

CPU: 64-bit processor

⚠ Note: With 768 MB RAM, the server should use max 512 MB Java heap. Larger heaps will fail.

2. Swap Space

Swap provides virtual memory for low-RAM systems.

Check current swap:
free -h
swapon --show

Create a new 2 GB swapfile:
sudo fallocate -l 2G /swapfile2
sudo chmod 600 /swapfile2
sudo mkswap /swapfile2
sudo swapon /swapfile2

Make swap permanent:

Add to /etc/fstab:

/swapfile2 none swap sw 0 0

Optional: Adjust swappiness (how aggressively swap is used):
sudo sysctl vm.swappiness=10


To make permanent, add to /etc/sysctl.conf:

vm.swappiness=10

3. Java Installation

Minecraft requires Java 21 for modern versions (class file version 65).

Install Java 21:
sudo dnf install -y java-21-openjdk

Set Java 21 as default:
sudo alternatives --config java

Verify version:
java -version


Expected output:

openjdk version "21"

4. Server Files

server_run.sh → script to start the server

run_server_screen_restart.sh → starts server in a screen session for background running

eula.txt → must contain eula=true to start server

world/ → game world data

Accept the EULA:
vi eula.txt
# change eula=false → eula=true

5. Recommended Java Heap Settings

For 768 MB RAM:

java -Xms256M -Xmx512M -jar server.jar nogui


-Xms → initial heap

-Xmx → maximum heap

nogui → disables graphical interface

6. Optional: Install screen for background server
sudo dnf install -y screen


Start server in screen session:

bash run_server_screen_restart.sh


Reattach to server session:

screen -r minecraft

7. Backup Your World

To backup world/:

cp -a world/ ../world_backup


-a preserves permissions, timestamps, and symbolic links.

8. Git Repository

Clone your server repository:

git clone https://github.com/come219/vanilla_server_test
cd vanilla_server_test


If you have local changes, stash them before pulling updates:

git stash push --include-untracked
git pull
git stash pop

9. Notes and Warnings

Swap prevents crashes but does not improve server speed.

Always keep Java heap ≤ available RAM.

Low-RAM servers are suitable for 1–2 players only.

Use backups before updating or deleting server files.




# +++++++++++++++++++++++++++



[root@wfe-lon1-01 vanilla_server_test]# cd ..
[root@wfe-lon1-01 ~]# dir
git_clone_command.txt  new_mc_server2025  old_vanilla_server  vanilla_server_test  world_backup
[root@wfe-lon1-01 ~]# rm -rf vanilla_server_test
[root@wfe-lon1-01 ~]# vi remove_folder_command.txt
[root@wfe-lon1-01 ~]# dir
git_clone_command.txt  new_mc_server2025  old_vanilla_server  remove_folder_command.txt  world_backup
[root@wfe-lon1-01 ~]# cat git_clone_command.txt 

git clone https://github.com/come219/vanilla_server_test
[root@wfe-lon1-01 ~]# ^C
[root@wfe-lon1-01 ~]# git clone https://github.com/come219/vanilla_server_test
Cloning into 'vanilla_server_test'...
remote: Enumerating objects: 143, done.
remote: Counting objects: 100% (5/5), done.
remote: Compressing objects: 100% (5/5), done.
remote: Total 143 (delta 0), reused 2 (delta 0), pack-reused 138 (from 1)
Receiving objects: 100% (143/143), 77.48 MiB | 34.02 MiB/s, done.
Resolving deltas: 100% (72/72), done.
[root@wfe-lon1-01 ~]# cd vanilla_server_test/
[root@wfe-lon1-01 vanilla_server_test]# dir
banned-ips.txt      ops.txt                       run_server.sh      server_run.txt.txt
banned-players.txt  readme.md                     server.jar         white-list.txt
eula.txt            run_server_screen_restart.sh  server.properties  windows_server.exe
logs                run_server_screen.sh          server_run.sh      world_minigames
[root@wfe-lon1-01 vanilla_server_test]# bash run_server_screen_restart.sh
Starting Vanilla Minecraft server (auto-restart enabled)...
run_server_screen_restart.sh: line 66: syntax error near unexpected token `('
run_server_screen_restart.sh: line 66: `SCREEN_ID=\$(screen -ls | grep \"$SCREEN_NAME\" | awk '{print \$1}')'
[root@wfe-lon1-01 vanilla_server_test]# dir
banned-ips.txt      ops.txt                       run_server.sh      server_run.txt.txt
banned-players.txt  readme.md                     server.jar         white-list.txt
eula.txt            run_server_screen_restart.sh  server.properties  windows_server.exe
logs                run_server_screen.sh          server_run.sh      world_minigames
[root@wfe-lon1-01 vanilla_server_test]# screen -d -f
There is a screen on:
        588923.mc_server        (Detached)
There is no screen to be detached.
[root@wfe-lon1-01 vanilla_server_test]# bash run_server_screen.sh
Changing to Minecraft server directory...
Starting Vanilla Minecraft server in screen session 'mc_server'...
Vanilla Minecraft server started successfully.
Screen session ID: 588923.mc_server

Attach with:
  screen -r mc_server
[root@wfe-lon1-01 vanilla_server_test]#




# ++++++++++++++++++++++++++++

[03:04:20] [Server thread/INFO]: ThreadedAnvilChunkStorage: All dimensions are saved
[root@wfe-lon1-01 vanilla_server_test]# cd ..
[root@wfe-lon1-01 ~]# dir
==================================
bash: start_server.sh: No such file or directory
----------------------------------
Server stopped or crashed.
Restarting in 5 seconds...
Time: Mon Dec 15 03:08:32 AM UTC 2025
----------------------------------
==================================
Starting Minecraft server...
Time: Mon Dec 15 03:08:37 AM UTC 2025
==================================
bash: start_server.sh: No such file or directory
----------------------------------
Server stopped or crashed.
Restarting in 5 seconds...
Time: Mon Dec 15 03:08:37 AM UTC 2025
----------------------------------
==================================
Starting Minecraft server...
Time: Mon Dec 15 03:08:42 AM UTC 2025
==================================
bash: start_server.sh: No such file or directory
----------------------------------
Server stopped or crashed.
Restarting in 5 seconds...
Time: Mon Dec 15 03:08:42 AM UTC 2025
----------------------------------
==================================
Starting Minecraft server...
Time: Mon Dec 15 03:08:47 AM UTC 2025
==================================
bash: start_server.sh: No such file or directory
----------------------------------
Server stopped or crashed.
Restarting in 5 seconds...
Time: Mon Dec 15 03:08:47 AM UTC 2025
----------------------------------
==================================
Starting Minecraft server...
Time: Mon Dec 15 03:08:52 AM UTC 2025
==================================
bash: start_server.sh: No such file or directory
----------------------------------
Server stopped or crashed.
Restarting in 5 seconds...
Time: Mon Dec 15 03:08:52 AM UTC 2025
----------------------------------
[screen is terminating]
[root@wfe-lon1-01 vanilla_server_test]#