# Local Flutter testing

This machine is Windows. Android tooling is installed here. Xcode, CocoaPods, and the iOS Simulator run only on macOS.

## SDK already installed on this Windows PC

- Flutter 3.47.5 stable: `D:\develop\flutter`
- User `Path` includes `D:\develop\flutter\bin` and `D:\develop\pub-cache\bin`
- `PUB_CACHE=D:\develop\pub-cache`
- Android SDK: `D:\Android\Sdk` (`ANDROID_HOME` and `ANDROID_SDK_ROOT`)
- `adb` is `D:\Android\Sdk\platform-tools\adb.exe`

Open a new terminal so the user `Path` is picked up, then:

```powershell
flutter doctor
adb version
```

## macOS (iOS + Android)

Install the same Flutter stable channel and add `flutter/bin` to `PATH`.

```bash
# Xcode from the App Store, then:
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
# CocoaPods
sudo gem install cocoapods
cd ios && pod install && cd ..
```

Android Studio: https://developer.android.com/studio (free). In SDK Manager install a platform, build-tools, platform-tools, and an emulator system image. Set:

```bash
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"
```

## API base URL

`API_BASE_URL` is compile-time (`String.fromEnvironment`). Rebuild after changing it. Hot reload does not apply.

```powershell
flutter run
flutter run --dart-define=API_BASE_URL=https://biztraqonline.com
flutter test --dart-define=API_BASE_URL=https://biztraqonline.com
```

Default when the flag is omitted: `https://biztraqonline.com`. The web login page is `https://biztraqonline.com/Auth/Login`.

## Tests

```powershell
dart run build_runner build --delete-conflicting-outputs
flutter test --coverage
dart pub global activate patrol_cli
patrol doctor
patrol test -t patrol_test/counter_test.dart
```

Classic providers and generated providers both read `greetingRepositoryProvider`. Tests replace it with `FakeGreetingRepository` via `ProviderContainer(overrides:)` or `ProviderScope(overrides:)`. Async values use `container.read(provider.future)`.

## Devices

```powershell
# Android emulator
avdmanager create avd -n pixel_api_35 -k "system-images;android-35;google_apis;x86_64" -d pixel
emulator -avd pixel_api_35
adb devices
```

Physical Android: enable Developer options and USB debugging, then `adb devices`.

iOS Simulator (macOS only):

```bash
open -a Simulator
flutter devices
```

Physical iPhone: trust the computer, enable Developer Mode, and sign the Runner target in Xcode.

## Patrol iOS target (macOS)

`ios/Podfile` already inherits `RunnerUITests`, and `ios/RunnerUITests/RunnerUITests.m` is in the repo. On a Mac, add a UI Testing Bundle target named `RunnerUITests` (Objective-C, test Runner) if it is not in the Xcode project yet. Match the iOS deployment target (15.0), turn off parallel testing for the scheme, and set User Script Sandboxing to No. Then `pod install`.

## CI

GitHub Actions (free): `flutter test --coverage` and `flutter build apk --debug`. Patrol on an emulator runs only when the workflow is started by hand with `run_patrol` enabled.
