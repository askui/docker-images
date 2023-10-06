# docker-images
Docker Images Including AskUI Components.

The images are published to the Docker Hub registry at [askui Docker Registry](https://hub.docker.com/repository/docker/askuigmbh/askui-ui-controller/general)

> ❗️ The images currently can __NOT__ be successfully run on Apple Silicon!

## Quickstart: Run Container

### Chrome

```shell
docker run -e ENABLE_VNC=true -p 6769:6769 -p 5900:5900 askuigmbh/askui-ui-controller:0.11.2-chrome-117.0-amd64

docker run -e ENABLE_VNC=true -p 6769:6769 -p 5900:5900 -p 7900:7900 ui-controller:chrome
```

> Password for VNC is `askui`.

### Android

```shell
docker run --rm --privileged -p 6080:6080 askuigmbh/askui-ui-controller:0.11.2-android-13.0

docker run --rm --privileged -p 6080:6080 -p 5900:5900 -p 6769:6769 ui-controller:android
```

> VNC is at port `6080`.

## Build

### Chrome

```shell
cd askui-ui-controller/chrome
docker build -t ui-controller:chrome .
```

Possible build-args:

* `CHROME_VERSION` (default 117.0.5938.132): All chrome versions.
* `ASKUI_CONTROLLER_VERSION`: Default is latest version. Currently `0.11.2`.

Enable VNC:

* Add `-e ENABLE_VNC=true` and expose the port `5900` like this `-p 5900:5900`

### Android

```shell
cd askui-ui-controller/android
docker build -t ui-controller:android .
```

Possible build-args:

* `ANDROID_VERSION`: `9.0`, `10.0`, `11.0`, `12.0`, `13.0` (default)
* `ASKUI_CONTROLLER_VERSION`: Default is latest version. Currently `0.11.2`.
