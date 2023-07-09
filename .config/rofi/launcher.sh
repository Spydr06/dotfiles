#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

rofi -show drun -theme ${SCRIPT_DIR}/launcher.rasi
