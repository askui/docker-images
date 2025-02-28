#!/usr/bin/env bash
set -x

VERBOSE=${VERBOSE:-""}
ASKUI_CONTROLLER_ARGS=${ASKUI_CONTROLLER_ARGS:-""}
if [ -n "$VERBOSE" ]; then
    ASKUI_CONTROLLER_ARGS="$ASKUI_CONTROLLER_ARGS --log-level=verbose"
fi


while ! xdpyinfo -display $DISPLAY > /dev/null 2>&1; do
  echo "Waiting for xvfb on display ${DISPLAY} ... "
  sleep 1
done

/home/seluser/.askui-suites/Binaries/askui-controller --no-sandbox -m -d 0 --host "0.0.0.0" --hide-overlay ${ASKUI_CONTROLLER_ARGS}
