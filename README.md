# docker-images
Docker Images Including AskUI Components.

The images are published to the Docker Hub registry at [askui Docker Registry](https://hub.docker.com/repository/docker/askuigmbh/askui-ui-controller/general).

They contain the AskUI UiController/Remote Device Controller that listens on port `6769` and a chrome browser/Android emulator. You have to configure the `uiControllerUrl` in your `UiControlClient` initialization in `askui-helper.ts` as described in [our docs](https://docs.askui.com/docs/api/Configuration/askui-ui-control-client#uicontrollerurl) to connect to it.

> ❗️ The images currently can __NOT__ be successfully run on Apple Silicon!

## Tag Naming Schema
We use the following tag schema:

``` bash
<controller-version>-<browser-name>-<browser-version>-amd64

# browser-name: chrome only for now

# Example
0.11.2-chrome-119.0.6045.123-amd64
```

> ❗️ `<controller-version>` is _NOT_ the AskUI version ❗️

## Quickstart: Run Container

### Chrome

```shell
docker run -p 6769:6769 -p 7900:7900 askuigmbh/askui-ui-controller:0.11.2-chrome-119.0-amd64
```

Ports:

* AskUI-Ui-Controller: `6769`
* No_VNC: `7900`

> Password for No_VNC is `secret`.

Run args:

* `SE_SCREEN_WIDTH`: default is `1360`
* `SE_SCREEN_HEIGHT`: default is `1020`
* `SE_SCREEN_DEPTH`: default is `24`
* `GOOGLE_CHROME_ARGS`: default empty
* `ASKUI_CONTROLLER_ARGS`: default empty
* `VERBOSE`: default empty

### Android

```shell
docker run --rm --privileged -p 6080:6080 askuigmbh/askui-ui-controller:0.11.2-android-13.0

docker run -p 6769:6769 -p 6080:6080 -e WEB_VNC=true --device /dev/kvm ui-controller:android
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

### Android

```shell
cd askui-ui-controller/android
docker build -t ui-controller:android .
```

Possible build-args:

* `ANDROID_VERSION`: `9.0`, `10.0`, `11.0`, `12.0`, `13.0` (default)
* `EMULATOR_DEVICE`: Default is `Samsung Galaxy S10` (See: [List of devices](https://github.com/budtmo/docker-android/tree/master#list-of-devices))
* `ASKUI_CONTROLLER_VERSION`: Default is latest version. Currently `0.11.2`.
