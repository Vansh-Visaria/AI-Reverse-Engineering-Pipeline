#!/bin/bash

TARGET="$1"

echo "[+] Starting full analysis on $TARGET"

# Static Analysis
ai-static-analysis.sh "$TARGET"

# Dynamic Analysis
ai-dynamic-analysis.sh "$TARGET"

# AI Suggestions
ai-suggestions.sh "$TARGET"

# Radare2 Analysis for Disassembly and Debugging
ai-radare2.sh "$TARGET"

# Volatility Analysis for Memory Dump (if you have a memory dump)
if [ -f "$TARGET" ]; then
    echo "[+] Memory dump file detected. Performing Volatility analysis..."
    ai-volatility.sh "$TARGET"
fi
