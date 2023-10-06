#!/usr/bin/env bash

GOOGLE_CHROME_ARGS=${GOOGLE_CHROME_ARGS:-""}

/usr/bin/google-chrome-stable --no-sandbox --start-maximized --no-first-run --enable-automation --disable-notifications ${GOOGLE_CHROME_ARGS} &
echo Starting Google Chrome...
