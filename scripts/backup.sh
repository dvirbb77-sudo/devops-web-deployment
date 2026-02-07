#!bin/bash/env bash
####################################
# Created by: Bibi
# Purpose: get a good grade
# Date: 2026-02-07
# Version: 0.0.1
set -o errexit
set -e
set -o nounse
###################################

SITE_DIR="/var/www/devops-site"
BACKUP_DIR="/var/backups/devops-site"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
BACKUP_FILE="$BACKUP_DIR/site-$TIMESTAMP.tar.gz"

if [ ! -d "$SITE_DIR" ]; then
    echo "Site directory does not exist: $SITE_DIR"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SITE_DIR"

BACKUPS=$(ls -1 "$BACKUP_DIR"/devops-site-*.tar.gz 2>/dev/null || true)
COUNT=$(echo "$BACKUPS" | wc -l | tr -d ' ')

if [ "$COUNT" -gt 5 ]; then
    REMOVE_COUNT=$((COUNT - 5))
    echo "$BACKUPS" | head -n "$REMOVE_COUNT" | while read -r old_backup; do
        rm -f "$old_backup"
    done
fi

echo "Backup created: $BACKUP_DIR/$BACKUP_FILE"
exit 0

