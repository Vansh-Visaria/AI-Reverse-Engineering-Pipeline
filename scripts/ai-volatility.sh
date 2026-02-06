#!/bin/bash

# Set model
MODEL="ultra-fast"

if [ -z "$1" ]; then
  echo "Usage: ai-volatility <memory-dump>"
  exit 1
fi

MEMORY_DUMP="$1"
echo "[+] Performing memory analysis with Volatility on $MEMORY_DUMP"

# Step 1: Run Volatility to check for processes
echo "[+] Checking for running processes in memory dump..."
volatility -f "$MEMORY_DUMP" --profile=LinuxUbuntu_16_04x64 pslist | ollama run $MODEL

# Step 2: Analyze potential rootkits or hidden processes
echo "[+] Searching for potential rootkits..."
volatility -f "$MEMORY_DUMP" --profile=LinuxUbuntu_16_04x64 hidden_procs | ollama run $MODEL

# Step 3: Detecting malicious network activity
echo "[+] Checking for suspicious network connections..."
volatility -f "$MEMORY_DUMP" --profile=LinuxUbuntu_16_04x64 netscan | ollama run $MODEL
