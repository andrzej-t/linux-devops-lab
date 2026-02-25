# Backup Tool Docker Container

## Overview
Container runs `backup.sh` inside Ubuntu to demonstrate:

- Linux command knowledge
- Bash scripting
- Containerization basics

## Build & Run

```bash
# From repo root
docker build -t backup-tool -f docker/backup-tool/Dockerfile .
docker run --rm backup-tool