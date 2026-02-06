# AI Reverse Engineering Pipeline

This repository contains a collection of automated reverse engineering analysis scripts that integrate **static analysis**, **dynamic analysis**, **Radare2 disassembly**, and **Volatility memory analysis**, powered by **AI models** to assist in the process.

## Setup Instructions

### Prerequisites

- Kali Linux (or compatible distro)
- Python 3.x
- `ollama` (Install it from [Ollama](https://ollama.com))
- Tools:
  - `strace`, `ltrace`, `peid`, `binwalk`, `checksec`
  - **Radare2** for disassembly
  - **Volatility** for memory analysis

### Install Dependencies

```bash
sudo apt update
sudo apt install -y radare2 volatility strace ltrace binwalk checksec peid
