#!/bin/bash

set -e

GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
NC="\033[0m"

LOG_DIR="/var/log"
echo -e "${CYAN}=== LOG ANALYSIS ===${NC}"
echo "Analyzing logs in $LOG_DIR"
echo

if [ ! -d "$LOG_DIR" ]; then
    echo "Log directory not found: $LOG_DIR"
    exit 1
fi

echo -e "${YELLOW}--- Top 5 Largest Log Files ---${NC}"
find "$LOG_DIR" -type f -name "*.log" -exec ls -lh {} + | sort -k5 -hr | head -n 5
echo

echo -e "${YELLOW}--- Error Count ---${NC}"
grep -i "error" "$LOG_DIR"/*.log 2>/dev/null | wc -l
echo

MAIN_LOG="$LOG_DIR/syslog"
if [ -f "$MAIN_LOG" ]; then
    echo -e "${YELLOW}--- Last 5 Lines of syslog ---${NC}"
    tail -n 5 "$MAIN_LOG"
fi
echo

echo -e "${GREEN}=== END OF LOG ANALYSIS ===${NC}"