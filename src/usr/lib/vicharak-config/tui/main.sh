# shellcheck shell=bash
# shellcheck disable=SC1090

if git status &>/dev/null && [[ -f "$PWD/src/usr/bin/vicharak-config" ]]
then
    ROOT_PATH="${ROOT_PATH:-"$PWD"}/src"
else
    ROOT_PATH="${ROOT_PATH:-}"
fi

source "${ROOT_PATH}/usr/lib/vicharak-config/mod/tui.sh"

source "${ROOT_PATH}/usr/lib/vicharak-config/tui/overlay/overlay.sh"
source "${ROOT_PATH}/usr/lib/vicharak-config/tui/comm/comm.sh"
source "${ROOT_PATH}/usr/lib/vicharak-config/tui/hardware/hardware.sh"
source "${ROOT_PATH}/usr/lib/vicharak-config/tui/local/local.sh"
source "${ROOT_PATH}/usr/lib/vicharak-config/tui/system/system.sh"
source "${ROOT_PATH}/usr/lib/vicharak-config/tui/advanced/advanced.sh"
source "${ROOT_PATH}/usr/lib/vicharak-config/tui/user/user.sh"

if $DEBUG
then
    source "${ROOT_PATH}/usr/lib/vicharak-config/tui/test/test.sh"
fi

__tui_about() {
    msgbox "vicharak-config - Vicharak system setup utility

Copyright $(date +%Y) Vicharak Computers LLP"
}

__tui_main() {
    menu_init
    menu_add __system "System Maintaince"
    menu_add __hardware "Hardware"
    menu_add __overlay "Overlays"
    menu_add __comm "Connectivity"
    menu_add __advanced "Advanced Options"
    menu_add __user "User Settings"
    menu_add __local "Localization"
    if $DEBUG
    then
        menu_add __advanced "Common advanced Options"
        menu_add __test "TUI Test"
    fi
    menu_add __tui_about "About"
    menu_show "Please select an option below:"
}
