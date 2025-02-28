ARG CHROME_VERSION=117.0
FROM selenium/standalone-chrome:${CHROME_VERSION}

USER root

ARG ASKUI_SUITE_VERSION=24.12.1
RUN curl -L --progress-bar --retry 5 --continue-at - -o "/AskUI-Suite-User-Installer-Linux-x64-Full.run" "https://files.askui.com/releases/Installer/${ASKUI_SUITE_VERSION}/AskUI-Suite-${ASKUI_SUITE_VERSION}-User-Installer-Linux-x64-Full.run" && \
    chmod +x /AskUI-Suite-User-Installer-Linux-x64-Full.run && \
    echo $(bash /AskUI-Suite-User-Installer-Linux-x64-Full.run  --help) && \
    bash /AskUI-Suite-User-Installer-Linux-x64-Full.run --accept-license --silent-mode && \
    rm -f /AskUI-Suite-User-Installer-Linux-x64-Full.run


RUN chown -R seluser:seluser /home/seluser/.askui-suites/
RUN chown -R seluser:seluser /home/seluser/.cache

COPY selenium.conf /etc/supervisor/conf.d/
COPY start-askui-ui-controller.sh start-google-chrome.sh /opt/bin/

USER seluser

ENV GOOGLE_CHROME_ARGS=
ENV ASKUI_CONTROLLER_ARGS=
ENV VERBOSE=
