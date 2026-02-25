#!/bin/bash

set -e

GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
NC="\033[0m"

SOURCE_DIR="$HOME"
BACKUP_DIR="$HOME/backup"
mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="backup_$TIMESTAMP.tar.gz"

echo -e "${CYAN}=== BACKUP ===${NC}"
echo "Backing up $SOURCE_DIR to $BACKUP_DIR/$ARCHIVE_NAME"
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" --exclude="backup" -C "$HOME" .

if [ -f "$BACKUP_DIR/$ARCHIVE_NAME" ]; then
    echo -e "${GREEN}Backup completed successfully.${NC}"
else
    echo -e "${YELLOW}Backup failed!${NC}"
    exit 1
fi

echo -e "${GREEN}=== END OF BACKUP ===${NC}"