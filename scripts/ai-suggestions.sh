#!/bin/bash

# Set model
MODEL="ultra-fast"

if [ -z "$1" ]; then
  echo "Usage: ai-suggestions <binary-file>"
  exit 1
fi

TARGET="$1"
echo "[+] Analyzing $TARGET and requesting suggestions..."

# Step 1: Perform static analysis
ai-static-analysis.sh "$TARGET"

# Step 2: If packed binary detected, ask AI for unpacking suggestions
{
  echo "This binary might be packed or obfuscated. Provide possible unpacking or de-obfuscation techniques."
} | ollama run $MODEL

# Step 3: Perform dynamic analysis
ai-dynamic-analysis.sh "$TARGET"

# Step 4: Ask AI for next steps
{
  echo "Based on the dynamic and static analysis, what are the next steps?"
} | ollama run $MODEL
