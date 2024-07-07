#!/bin/bash
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"
set -o pipefail

function run_as_root() {
    source ./functions.sh

    if ! command -v figlet &>/dev/null || ! command -v xinput &>/dev/null; then
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        echo "Make sure to run '~/Deckpad/initialize_after_os_update.sh' after updating SteamOS"
        sleep 5
        exit 1
    fi

    # Start
    set_brightness_to_minimum
    disable_sleep
    find_controller
    start_virtualhere

    # Run - Block until Tap on screen
    run_prompt_start
    block_until_press_on_target

    # Quit
    run_prompt_stop
    quit_prompt &
    quit_prompt_pid=$!
    restore_brightness
    reenable_sleep
    stop_virtualhere
    reset_controller
    wait quit_prompt_pid
}

source ./functions.sh
prepare_fullscreen
show_prompt "Enter sudo password" 'big'
show_prompt "(screen will dim)" 'big'

xhost local:root >/dev/null
FUNC=$(declare -f run_as_root)
sudo bash -c "$FUNC; run_as_root"

cd - >/dev/null
