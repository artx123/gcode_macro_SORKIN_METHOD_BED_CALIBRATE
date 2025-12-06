#!/bin/sh

set -e

source /opt/config/mod/.shell/0.sh


INC="[include plugins/gcode_macro-SORKIN_METHOD_BED_CALIBRATE/new_macro_bed_call.cfg]"
FILE="/opt/config/mod_data/plugins.cfg"

PLUGIN_DIR="/root/printer_data/config/mod_data/plugins/gcode_macro_SORKIN_METHOD_BED_CALIBRATE"
REPO_URL="https://github.com/artx123/gcode_macro-SORKIN_METHOD_BED_CALIBRATE.git"

echo "I create a directory: ${PLUGIN_DIR}"
mkdir -p "${PLUGIN_DIR}"

echo "Clone the repository..."
git clone "${REPO_URL}" "${PLUGIN_DIR}"

if [ ! -f "${PLUGIN_DIR}/new_macro_bed_call.cfg" ]; then
    echo "error: файл new_macro_bed_call.cfg не найден после клонирования!"
    exit 1
fi

echo "check and add a line in ${FILE}..."
grep -q "${INC}" "${FILE}" || echo "${INC}" >> "${FILE}"

# 5. Сообщения об успехе
echo "Plugin installed: ${PLUGIN_DIR}"
echo "plugin installed"
echo "REBOOT" >/tmp/printer
