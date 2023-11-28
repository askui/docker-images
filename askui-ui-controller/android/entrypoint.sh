#!/bin/bash
VERBOSE=${VERBOSE:-""}
ASKUI_CONTROLLER_ARGS=${ASKUI_CONTROLLER_ARGS:-""}
if [ -n "$VERBOSE" ]; then
    ASKUI_CONTROLLER_ARGS="$ASKUI_CONTROLLER_ARGS --log-level=verbose"
fi

echo starting the android emulator
adb wait-for-device
is_it_up=$(adb shell getprop sys.boot_completed | tr -d '\r')
while [ "$is_it_up" != "1" ]; do
        sleep 5
        echo 'the emulator is starting'
        is_it_up=$(adb shell getprop sys.boot_completed | tr -d '\r')
done
sleep 10
echo The emulator is started
curl "https://raw.githubusercontent.com/senzhk/ADBKeyBoard/v2.0/ADBKeyboard.apk" --output /root/ADBKeyboard.apk
echo installing ADB keyboard
adb install -r /root/ADBKeyboard.apk
sleep 2
adb shell settings put secure default_input_method com.android.adbkeyboard/.AdbIME
sleep 2
adb shell ime enable com.android.adbkeyboard/.AdbIME

adb devices
 sleep 5

/askui-ui-controller.AppImage --appimage-extract-and-run  --no-sandbox -m -d 0 --host "0.0.0.0" ${ASKUI_CONTROLLER_ARGS}

wait
