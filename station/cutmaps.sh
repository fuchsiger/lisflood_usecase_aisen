#!/bin/bash
set -euo pipefail

WORK_DIR="./../maps/"

cutmaps \
  -F "${WORK_DIR}/upArea_unclipped.nc" \
  -l "${WORK_DIR}/ldd_repaired.map" \
  -N "outlet.txt" \
  -o "${WORK_DIR}/cutmaps_test/" \
  -W