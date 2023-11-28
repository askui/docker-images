ARG ANDROID_VERSION=13.0
FROM budtmo/docker-android:emulator_${ANDROID_VERSION}

ENV EMULATOR_DEVICE="Samsung Galaxy S10"

USER root

ARG ASKUI_CONTROLLER_VERSION=0.11.2
RUN curl -L --progress-bar --retry 5 --continue-at - -o "/askui-ui-controller.AppImage" "https://files.askui.com/releases/askui-ui-controller/v${ASKUI_CONTROLLER_VERSION}/linux/x64/askui-ui-controller.AppImage" && \
    chmod +x /askui-ui-controller.AppImage

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER 1300:1301

CMD /entrypoint.sh