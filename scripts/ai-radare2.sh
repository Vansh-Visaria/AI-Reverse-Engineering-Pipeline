#!/bin/bash

# Set model
MODEL="ultra-fast"

if [ -z "$1" ]; then
  echo "Usage: ai-radare2 <binary-file>"
  exit 1
fi

TARGET="$1"
echo "[+] Performing disassembly and analysis with Radare2 on $TARGET"

# Step 1: Run Radare2 to analyze the binary and show the disassembly
echo "[+] Running Radare2 for disassembly..."
radare2 -A "$TARGET" -q -c "aa; afl; pd 50" | ollama run $MODEL

# Step 2: Analyze functions and potential vulnerabilities
echo "[+] Analyzing functions and detecting vulnerabilities..."
radare2 -A "$TARGET" -q -c "af; afl" | ollama run $MODEL
