#!/bin/bash
# clean old temp files
set -euxo pipefail

ageLimit=${1:-5}

find /tmp \
  -maxdepth 1 \
  -mtime +$ageLimit \
  -user $(id -u) \
  -exec rm -rf '{}' \;
