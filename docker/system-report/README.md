# System Report Docker Container

## Overview
Container runs `system_report.sh` inside Ubuntu to demonstrate:

- Linux command knowledge
- Bash scripting
- Containerization basics

## Build & Run

```bash
# From repo root
docker build -t system-report -f docker/system-report/Dockerfile .
docker run --rm system-report