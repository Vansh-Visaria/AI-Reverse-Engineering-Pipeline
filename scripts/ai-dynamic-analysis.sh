#!/bin/bash

# Set model
MODEL="ultra-fast"

if [ -z "$1" ]; then
  echo "Usage: ai-dynamic-analysis <binary-file>"
  exit 1
fi

TARGET="$1"
echo "[+] Performing dynamic analysis on $TARGET"

# Step 1: Use strace to trace system calls
echo "[+] Tracing system calls with strace..."
strace -f -e trace=all -o strace_output.txt "$TARGET"
cat strace_output.txt | ollama run $MODEL

# Step 2: Use ltrace to trace library calls
echo "[+] Tracing library calls with ltrace..."
ltrace -f -o ltrace_output.txt "$TARGET"
cat ltrace_output.txt | ollama run $MODEL
