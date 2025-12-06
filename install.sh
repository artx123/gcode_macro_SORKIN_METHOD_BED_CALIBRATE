#!/bin/sh

set -e

source /opt/config/mod/.shell/0.sh

INC="[include plugins/gcode_macro_SORKIN_METHOD_BED_CALIBRATE/new_macro_bed_call.cfg]"
FILE="/opt/config/mod_data/plugins.cfg"

grep -q "${INC}" "${FILE}" || echo "${INC}" >> "${FILE}"

echo "plugin installed"
echo "REBOOT" >/tmp/printer
