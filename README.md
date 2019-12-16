# To Do Flutter Clean Architecture Implementation
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 


## Overview
This is a todo implementation base on https://github.com/ShadyBoukhary/flutter_clean_architecture an clean architecture flutter that makes it easy and intuitive to implement Uncle Bob's Clean Architecture in Flutter. 

## Installation

### 1. Install it
You can install packages from the command line:

with Flutter:

```shell
$ flutter packages get
```

### 2. Install NDK
The `moor` packages need [Android NDK](https://developer.android.com/ndk/downloads/index.html).

Add `ndk.dir` with the NDK's location under `local.properties`

e.g.
```
sdk.dir=/home/test/Android/Sdk
ndk.dir=/home/test/Android/Sdk/ndk/20.1.5948944
flutter.sdk=/home/test/flutter
flutter.buildMode=debug
flutter.versionName=1.0.0
flutter.versionCode=1
```

Alternatively, your editor might support `flutter packages get`. Check the docs for your editor to learn more.
