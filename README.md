## Samples for the SwiftAndroid toolchain.

Requires a build of the latest Android toolchain downloadable [here](http://johnholdsworth.com/android_toolchain.tgz),
an [Android NDK](http://developer.android.com/ndk/downloads/index.html) as well as [the Gradle plugin]
(https://github.com/SwiftJava/swift-android-gradle) on a Ubuntu 15 System. The phone must be api 21
aka Android v5+ aka Lollipop or better (I used an LG K4.) Make sure the version of swiftc in the
toolchain appears first in your path and there is a swift-build from a swift.org toolchain in the
path and finally, that the `ANDROID_NDK_HOME` environment variable is set to the path to the NDK.

To create a new application, decide on a pair of interfaces to connect to and from your Swift
code and place them in a [Java Source](https://github.com/SwiftJava/swift-android-samples/blob/master/swifthello/src/main/java/com/jh/SwiftHello.java).
Use the command `./genswift.sh` in the [SwiftJava Project](https://github.com/SwiftJava/SwiftJava)
to generate Swift (& Java) sources to include in your application or adapt the
[genhello.sh](https://github.com/SwiftJava/SwiftJava/blob/master/genhello.sh) script.
If you only use interfaces/protocols, your app's only
[Package.swift](https://github.com/SwiftJava/swift-android-samples/blob/master/swifthello/src/main/swift/Package.swift)
dependency should be the core JNI interfacing code [java_swift](https://github.com/SwiftJava/java_swift).

## 

Simple demo of Swift code accessed over JNI.

To build, setup the Gradle plugin, then run `./gradlew installDebug`

This demo is licensed under the Creative Commons CC0 license:
do whatever you want.

