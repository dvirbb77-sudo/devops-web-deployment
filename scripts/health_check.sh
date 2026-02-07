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

RESPONSE=$(curl -ks "https://localhost/health.html" || true)

if [response == "OK"]; then
 echo "happy healthy and alive"
 exit 0
else
 echo "failed"
 exit 1
fi
