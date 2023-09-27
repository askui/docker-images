# docker-images
Docker Images Including AskUI Components.

The images are published to the Docker Hub registry at [askui Docker Registry](https://hub.docker.com/repository/docker/askuigmbh/askui-ui-controller/general)

> ❗️ The images currently can __NOT__ be successfully run on Apple Silicon!

## Quickstart: Run Container

### Chrome

```shell
docker run -e ENABLE_VNC=true -p 6769:6769 -p 5900:5900 askuigmbh/askui-ui-controller:v0.12.0-chrome-117-amd64
```

> Password for VNC is `askui`.

### Android

```shell
docker run --rm --privileged -p 6080:6080 askui-ui-controller:v0.12.0-android-12-x86
```

> VNC is at port `6080`.

## Build

### Chrome

```shell
cd askui-ui-controller/chrome
docker build -t ui-controller:chrome .
```

Possible build-args:

* `SELENOID_VNC_CHROME_VERSION` (default 117): Only major release versions supported at the moment.
* `ASKUI_CONTROLLER_VERSION`: Default is latest version. Currently `0.11.2`.

Enable VNC:

* Add `-e ENABLE_VNC=true` and expose the port `5900` like this `-p 5900:5900`

### Android

```shell
cd askui-ui-controller/android
docker build -t ui-controller:android .
```
