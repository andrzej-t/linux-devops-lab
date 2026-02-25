#!/bin/bash

set -e

GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
NC="\033[0m"

echo -e "${CYAN}=== SYSTEM REPORT ===${NC}"
echo "Generated: $(date)"
echo

echo -e "${YELLOW}--- CPU Info ---${NC}"
if command -v lscpu &>/dev/null; then
    lscpu
else
    echo "lscpu command not found"
fi
echo

echo -e "${YELLOW}--- Memory Usage ---${NC}"
if command -v free &>/dev/null; then
    free -h
else
    echo "free command not found"
fi
echo

echo -e "${YELLOW}--- Disk Usage ---${NC}"
df -h
echo

echo -e "${YELLOW}--- Top 10 Processes by Memory ---${NC}"
ps aux --sort=-%mem | head -n 10
echo

echo -e "${YELLOW}--- Network Interfaces ---${NC}"
if command -v ip &>/dev/null; then
    ip addr
else
    echo "ip command not found"
fi
echo

echo -e "${YELLOW}--- Currently Logged-in Users ---${NC}"
who
echo

echo -e "${GREEN}=== END OF REPORT ===${NC}"