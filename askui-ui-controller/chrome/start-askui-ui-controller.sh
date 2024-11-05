#!/usr/bin/env bash
set -x

VERBOSE=${VERBOSE:-""}
ASKUI_CONTROLLER_ARGS=${ASKUI_CONTROLLER_ARGS:-""}
if [ -n "$VERBOSE" ]; then
    ASKUI_CONTROLLER_ARGS="$ASKUI_CONTROLLER_ARGS --log-level=verbose"
fi

ls -la /home/seluser/.askui-suites/Binaries/resources/assets/binaries/AskuiRemoteDeviceController

/home/seluser/.askui-suites/Binaries/resources/assets/binaries/AskuiRemoteDeviceController --showOverlay False &

/home/seluser/.askui-suites/Binaries/askui-controller --no-sandbox -m -d 0 --host "0.0.0.0" ${ASKUI_CONTROLLER_ARGS}
