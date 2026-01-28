#!/bin/bash
set -euo pipefail

WORK_DIR="./../meteo/"
LDD_DIR="./../maps/" 
cutmaps \
  -f "${WORK_DIR}" \
  -l "${LDD_DIR}/ldd_repaired.map" \
  -N "outlet.txt" \
  -o "${WORK_DIR}/meteo_clipped/" \
  -W