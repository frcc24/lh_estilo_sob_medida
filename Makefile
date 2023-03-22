SHELL := /bin/bash
.PHONY: build-apk

APP_NAME = br.com.lighthouse

# Enable Firebase Analytics Debug mode on an Android device.
start-debug-events:
	adb shell setprop debug.firebase.analytics.app $(APP_NAME)

# Disable Firebase Analytics Debug mode on an Android device.
stop-debug-events:
	adb shell setprop debug.firebase.analytics.app .none.

# Execute all integration tests on an iOS simulator
# To list device type ids and runtimes ids: xcrun simctl list devicetypes runtimes
it-ios-sim:
	@# Boot device and uninstall app
	@xcrun simctl boot iPhone\ 8 ||:
	@xcrun simctl uninstall iPhone\ 8 $(APP_NAME) ||:

	@# Uncomment if you want to launch the simulator GUI too
	@#/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app/Contents/MacOS/Simulator &

	@# Run integration tests on booted device and shutdown the device afterwards
	flutter test integration_test/main.dart --device-id iPhone\ 8 -r expanded --dart-define=testing_mode=true
	@xcrun simctl uninstall iPhone\ 8 $(APP_NAME) ||:
	@xcrun simctl shutdown iPhone\ 8 ||:
	@killall Simulator ||:

# Execute all integration tests on an android device
it-android:
	@# Pre install app to grant all permissions
	@adb uninstall $(APP_NAME) ||:
	flutter build apk --debug
	adb install build/app/outputs/flutter-apk/app-debug.apk

	# Uncomment to give app camera permission
	# adb shell pm grant $(APP_NAME) android.permission.CAMERA

	@# Run integration tests with all needed permissions granted
	flutter test integration_test/main.dart -r expanded  --dart-define=testing_mode=true

# CI Tests
ci-tests:
	flutter format --set-exit-if-changed -n . -l 150
	flutter analyze
	flutter test test -r expanded

# Format code:
format-code:
	flutter format . -l 150

# Generate native splash screen and launcher icon
generate-code:
	#flutter pub run build_runner build --delete-conflicting-outputs
	flutter pub run flutter_native_splash:create
	flutter pub run flutter_launcher_icons:main
	#make format-code

# Run app in debug mode
run-debug:
	flutter run --debug

# Run app in release mode
run-release:
	flutter run --release

# Build the apk and put it at <app dir>/build/app/outputs/flutter-apk/*-release.apk
build-apk:
	flutter build apk

# Build the aab and put it at <app dir>/build/app/outputs/bundle/release/*-release.aab
build-aab:
	flutter build appbundle

# Restart adb service
adb-restart:
	adb kill-server
	adb start-server

clean:
	flutter clean
	flutter pub get

cache-repair:
	flutter pub cache repair
	make clean

clean-ios:
	make clean
	# If running fro macos with m1 chip
	arch -x86_64 pod update --project-directory=ios/
	arch -x86_64 pod install --project-directory=ios/
	#pod update --project-directory=ios/
    #pod install --project-directory=ios/

upgrade-all:
	flutter pub upgrade --major-versions