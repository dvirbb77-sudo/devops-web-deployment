#!bin/bash/env bash
####################################
# Created by: Bibi
# Purpose: get a good grade
# Date: 2026-02-07
# Version: 0.0.1
set -o errexit
set -e
set -o nounse
####################################

BACKUP_DIR="/var/backups/devops-site"
SITE_DIR="/var/www/devops-site"

BACKUP_FILE=$(ls -1t "$BACKUP_DIR"/site-*.tar.gz | sed -n '2p')

if [ -z "$BACKUP_FILE" ]; then
  echo "No previous backup found"
  exit 1
fi

rm -rf "$SITE_DIR"/*
tar -xzf "$BACKUP_FILE" -C "$SITE_DIR" || exit 1

systemctl reload nginx || exit 1

echo "Rollback completed using $(basename "$BACKUP_FILE")"
exit 0

