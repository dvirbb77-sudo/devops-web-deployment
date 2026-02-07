#!bin/bash/env bash
####################################
# Created by: Bibi
# Purpose: get a good grade
# Date: 2026-02-07
# Version: 0.0.1
set -o errexit
set -e
set -o nounset
###################################

SITE_SRC="./site"
SITE_ROOT="/var/www/devops-site"
VERSION=$(date +"%Y.%m.%d.%H%M")

./scripts/backup.sh || exit 1

mkdir -p "$SITE_ROOT"
cp -r "$SITE_SRC"/* "$SITE_ROOT"/ || exit 1

nginx -t
if [ $? -ne 0 ]; then
  exit 1
fi

systemctl reload nginx || exit 1

echo "Deployment successful. Version: $VERSION"
exit 0

