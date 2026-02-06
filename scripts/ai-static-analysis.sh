#!/bin/bash

# Set model
MODEL="ultra-fast"

if [ -z "$1" ]; then
  echo "Usage: ai-static-analysis <binary-file>"
  exit 1
fi

TARGET="$1"
echo "[+] Performing static analysis on $TARGET"

# Step 1: Basic file check
echo "[+] Running file command..."
file "$TARGET" | ollama run $MODEL

# Step 2: PEiD check for packed binaries (Windows PE files)
echo "[+] Checking for packed binaries..."
peid -v "$TARGET" | ollama run $MODEL

# Step 3: Checksec (for security hardening checks like PIE, NX, Canary)
echo "[+] Running Checksec for security hardening checks..."
checksec --fortify-file="$TARGET" | ollama run $MODEL

# Step 4: Binwalk (looking for embedded files)
echo "[+] Scanning for embedded files with Binwalk..."
binwalk "$TARGET" | ollama run $MODEL
