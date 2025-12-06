#!/bin/sh

set -e

source /opt/config/mod/.shell/0.sh

INC="[include plugins/gcode_macro_SORKIN_METHOD_BED_CALIBRATE/new_macro_bed_call.cfg]"
FILE="/opt/config/mod_data/plugins.cfg"
PLUGIN_DIR="/opt/config/mod_data/plugins/gcode_macro_SORKIN_METHOD_BED_CALIBRATE"
REPO_URL="https://github.com/artx123/gcode_macro_SORKIN_METHOD_BED_CALIBRATE.git"


echo "Проверяю и добавляю строку в ${FILE}..."
grep -q "${INC}" "${FILE}" || echo "${INC}" >> "${FILE}"


echo "Плагин установлен: ${PLUGIN_DIR}"
echo "plugin installed"
echo "REBOOT" >/tmp/printer
