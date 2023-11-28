ARG CHROME_VERSION=117.0
FROM selenium/standalone-chrome:${CHROME_VERSION}

USER root

ARG ASKUI_CONTROLLER_VERSION=0.11.2
RUN curl -L --progress-bar --retry 5 --continue-at - -o "/askui-ui-controller.AppImage" "https://files.askui.com/releases/askui-ui-controller/v${ASKUI_CONTROLLER_VERSION}/linux/x64/askui-ui-controller.AppImage" && \
    chmod +x /askui-ui-controller.AppImage

COPY selenium.conf /etc/supervisor/conf.d/
COPY start-askui-ui-controller.sh start-google-chrome.sh /opt/bin/

USER seluser

ENV GOOGLE_CHROME_ARGS=
ENV ASKUI_CONTROLLER_ARGS=
ENV VERBOSE=
