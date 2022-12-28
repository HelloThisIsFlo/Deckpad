#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"
set -o pipefail

function run_as_root() {
    source ./functions.sh

    # Start
    set_brightness_to_minimum
    disable_sleep
    start_virtualhere

    # Run - Block until Tap on screen
    run_prompt_start
    block_until_press_on_target

    # Quit
    run_prompt_stop
    quit_prompt &
    restore_brightness
    reenable_sleep
    stop_virtualhere
    wait
}

source ./functions.sh
prepare_fullscreen
show_prompt "Enter sudo password" 'big'
show_prompt "(screen will dim)" 'big'

xhost local:root >/dev/null
FUNC=$(declare -f run_as_root)
sudo bash -c "$FUNC; run_as_root"

cd - >/dev/null
