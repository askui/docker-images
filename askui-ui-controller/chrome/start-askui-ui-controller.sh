#!/usr/bin/env bash

VERBOSE=${VERBOSE:-""}
ASKUI_CONTROLLER_ARGS=${ASKUI_CONTROLLER_ARGS:-""}
if [ -n "$VERBOSE" ]; then
    ASKUI_CONTROLLER_ARGS="$ASKUI_CONTROLLER_ARGS --log-level=verbose"
fi

/askui-ui-controller.AppImage --appimage-extract-and-run  --no-sandbox -m -d 0 --host "0.0.0.0" ${ASKUI_CONTROLLER_ARGS}
