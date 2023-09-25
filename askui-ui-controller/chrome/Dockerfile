ARG SELENOID_VNC_CHROME_VERSION=117.0

FROM selenoid/vnc_chrome:${SELENOID_VNC_CHROME_VERSION}

USER root

RUN usermod -l askui selenium && \
    usermod -d /home/askui -m askui && \
    chown -R askui:root /home/askui && \
    echo "askui:askui" | chpasswd

ARG ASKUI_CONTROLLER_VERSION=0.12.0
RUN curl -L --progress-bar --retry 5 --continue-at - -o "/askui-ui-controller.AppImage" "https://files.askui.com/releases/askui-ui-controller/v${ASKUI_CONTROLLER_VERSION}/linux/x64/askui-ui-controller.AppImage" && \
    chmod +x /askui-ui-controller.AppImage

COPY entrypoint.sh /entrypoint.sh

USER askui
