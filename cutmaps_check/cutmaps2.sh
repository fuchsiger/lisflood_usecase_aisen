#!/bin/bash
set -euo pipefail

WORK_DIR="./../cutmaps_check/"

cutmaps \
  -F "${WORK_DIR}/upArea_repaired.nc" \
  -l "${WORK_DIR}/ldd_repaired_Global_stefania.map" \
  -N "${WORK_DIR}/outlet.txt" \
  -o "${WORK_DIR}/cutmaps_test_stefania2/" \
  -W