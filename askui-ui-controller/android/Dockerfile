FROM grichner/docker-android-x86-12.0

USER root

ENV DEVICE="Samsung Galaxy S10"

RUN apt update -y && apt install -y \
    adb libgtk-3-0 ffmpeg

# VNC Server
EXPOSE 6080 
# AskUI UIController
EXPOSE 6769
# phone
EXPOSE 5555

ARG ASKUI_CONTROLLER_VERSION=0.12.0
RUN curl -L --progress-bar --retry 5 --continue-at - -o "/askui-ui-controller.AppImage" "https://files.askui.com/releases/askui-ui-controller/v${ASKUI_CONTROLLER_VERSION}/linux/x64/askui-ui-controller.AppImage" && \
    chmod +x /askui-ui-controller.AppImage

COPY entrypoint.sh /entrypoint.sh

USER askui
