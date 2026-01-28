#!/bin/bash
set -euo pipefail

WORK_DIR="./../maps/"

catchstats \
  -i "${WORK_DIR}/catchstats_inputs" \
  -m "${WORK_DIR}/catchstats_inputs/mask" \
  -s mean max \
  -o "${WORK_DIR}/cutmaps_test/" \
  -a "${WORK_DIR}/pixarea_Global_03min.nc/"\
  -W