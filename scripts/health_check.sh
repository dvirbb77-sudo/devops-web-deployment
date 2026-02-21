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
  
STATUS=$(curl -s -o /dev/null -w "%{http_code}" https://localhost || true)
  
if [ $STATUS == "OK" ]; then
echo "happy healthy and alive"
exit 0
else
echo "getting error code $STATUS"
exit 1
fi
