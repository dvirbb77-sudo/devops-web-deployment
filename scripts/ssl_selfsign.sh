#!bin/bash/env bash
####################################
# Created by: Bib
# Purpose: get a good grade
# Date: 2026-02-07
# Version: 0.0.1
set -o errexit
set -e
set -o nounset
###################################

CERT_DIR="/etc/nginx/ssl"
CERT="$CERT_DIR/devops-site.crt"
KEY="$CERT_DIR/devops-site.key"

mkdir -p "$CERT_DIR"

if [ -f "$CERT" ] || [ -f "$KEY" ]; then
  echo "Certificate already exists"
  exit 1
fi

openssl req -x509 -nodes -days 365 \
  -newkey rsa:2048 \
  -keyout "$KEY" \
  -out "$CERT" \
  -subj "/C=US/ST=State/L=City/O=DevOps/CN=localhost"

chmod 600 "$KEY"
exit 0


