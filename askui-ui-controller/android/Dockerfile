ARG ANDROID_VERSION=13.0
FROM budtmo/docker-android:emulator_${ANDROID_VERSION}

ENV EMULATOR_DEVICE="Samsung Galaxy S10"

ENV PROCESS_PATH="/home/androidusr/docker-android/mixins/configs/process/"
COPY supervisord-screen.conf ${PROCESS_PATH}

USER root

RUN sudo apt-get update \
 && sudo DEBIAN_FRONTEND=noninteractive apt-get install -yq \
   libatk1.0-0 \
   libatk-bridge2.0-0 \
   libgtk-3-0\
   vim

ARG ASKUI_CONTROLLER_VERSION=0.11.2
RUN curl -L --progress-bar --retry 5 --continue-at - -o "/askui-ui-controller.AppImage" "https://files.askui.com/releases/askui-ui-controller/v${ASKUI_CONTROLLER_VERSION}/linux/x64/askui-ui-controller.AppImage" && \
    chmod +x /askui-ui-controller.AppImage

COPY entrypoint.sh /entrypoint.sh
RUN chmod 777 /entrypoint.sh

USER 1300:1301
