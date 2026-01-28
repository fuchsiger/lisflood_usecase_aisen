#!/bin/bash
set -euo pipefail

WORK_DIR="./../cutmaps_check/"

cutmaps \
  -F "${WORK_DIR}/thetar2_f_Global2_03min.nc" \
  -l "${WORK_DIR}/ldd_repaired_timo.map" \
  -N "${WORK_DIR}/outlet.txt" \
  -o "${WORK_DIR}/cutmaps_test_stefania2/" \
  -W