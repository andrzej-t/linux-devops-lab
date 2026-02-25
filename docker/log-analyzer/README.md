# Log Analyzer

## Overview
Container runs `log_analyzer.sh` inside Ubuntu to demonstrate:

- Linux command knowledge
- Bash scripting
- Containerization basics

## Build & Run

```bash
# From repo root
docker build -t log-analyzer -f docker/log-analyzer/Dockerfile .
docker run --rm log-analyzer