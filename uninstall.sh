#!/bin/sh

set -e

source /opt/config/mod/.shell/0.sh

INC="[include plugins/gcode_macro-SORKIN_METHOD_BED_CALIBRATE/new_macro_bed_call.cfg]"
FILE="/opt/config/mod_data/plugins.cfg"

if grep -q "${INC}" "${FILE}"; then
    sed -i "/${INC}/d" "${FILE}"
    echo "Line removed from ${FILE}"
else
    echo "Line not found in ${FILE}"
fi

echo "plugin uninstalled"
echo "REBOOT" >/tmp/printer
