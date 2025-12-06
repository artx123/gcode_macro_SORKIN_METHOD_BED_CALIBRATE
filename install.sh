#!/bin/sh

set -e

source /opt/config/mod/.shell/0.sh

INC="[include plugins/gcode_macro_SORKIN_METHOD_BED_CALIBRATE/new_macro_bed_call.cfg]"
FILE="/opt/config/mod_data/plugins.cfg"
PLUGIN_DIR="/opt/config/mod_data/plugins/gcode_macro_SORKIN_METHOD_BED_CALIBRATE"
REPO_URL="https://github.com/artx123/gcode_macro_SORKIN_METHOD_BED_CALIBRATE.git"

# 1. Создаём папку в нужном месте
echo "Создаю директорию: ${PLUGIN_DIR}"
mkdir -p "${PLUGIN_DIR}"

# 2. Клонируем репозиторий в созданную папку
echo "Клонирую репозиторий в ${PLUGIN_DIR}..."
git clone "${REPO_URL}" "${PLUGIN_DIR}"


# 3. Проверяем наличие файла new_macro_bed_call.cfg
if [ ! -f "${PLUGIN_DIR}/new_macro_bed_call.cfg" ]; then
    echo "Ошибка: файл new_macro_bed_call.cfg не найден после клонирования!"
    exit 1
fi

# 4. Проверяем и добавляем строку в plugins.cfg (если её ещё нет)
echo "Проверяю и добавляю строку в ${FILE}..."
grep -q "${INC}" "${FILE}" || echo "${INC}" >> "${FILE}"


echo "Плагин установлен: ${PLUGIN_DIR}"
echo "plugin installed"
echo "REBOOT" >/tmp/printer
