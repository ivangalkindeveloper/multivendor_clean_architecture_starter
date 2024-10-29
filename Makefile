include .env

.PHONY: init pod-install build-runner clean repair upgrade format
.SILENT:

init:
	fvm install $(FLUTTER_VERSION) && fvm use $(FLUTTER_VERSION)
	bash ./bin/as_xc_check_version.sh $(XCODE_VERSION) $(ANDROID_STUDIO_VERSION)
	make pod-install
	make build-runner
	make clean

pod-install:
	cd ios && rm -rf Pods && rm -rf Podfile.lock && rm -rf Flutter/Flutter.podspec
	cd ios && pod deintegrate && sudo gem uninstall cocoapods && sudo gem uninstall cocoapods-core && sudo gem uninstall cocoapods-downloader
	cd ios && sudo gem install cocoapods && pod setup && flutter precache --ios && pod install --repo-update && pod cache clean --all && pod update
	fvm flutter clean && fvm flutter pub get

build-runner:
	find . -name \*.g.dart -type f -delete
	fvm dart run build_runner clean
	fvm dart run build_runner build --delete-conflicting-outputs
	cd package/mvs_database && rm -rf lib/generated && fvm dart run build_runner clean && fvm dart run build_runner build --delete-conflicting-outputs
	cd package/mvs_rest && rm -rf lib/generated && fvm dart run build_runner clean && fvm dart run build_runner build --delete-conflicting-outputs

clean:
	rm -rf ~/Library/Caches/CocoaPods
	rm -rf ~/Library/Application\ Support/Code/Cache/*
	rm -rf ~/Library/Application\ Support/Code/CachedData/*
	rm -rf ./build && rm -rf ./.dart_tool && rm -rf pubspec.lock
	fvm flutter clean && fvm flutter pub get
	cd package/mvs_database && rm -rf ./build && rm -rf ./.dart_tool && rm -rf pubspec.lock && fvm flutter clean && fvm flutter pub get
	cd package/mvs_rest && rm -rf ./build && rm -rf ./.dart_tool && rm -rf pubspec.lock && fvm flutter clean && fvm flutter pub get
	cd package/mvs_utility && rm -rf ./build && rm -rf ./.dart_tool && rm -rf pubspec.lock && fvm flutter clean && fvm flutter pub get
	cd package/mvs_widget && rm -rf ./build && rm -rf ./.dart_tool && rm -rf pubspec.lock && fvm flutter clean && fvm flutter pub get

repair:
	fvm flutter pub cache repair && fvm flutter pub get
	cd package/mvs_database && fvm flutter pub cache repair && fvm flutter pub get
	cd package/mvs_rest && fvm flutter pub cache repair && fvm flutter pub get
	cd package/mvs_utility && fvm flutter pub cache repair && fvm flutter pub get
	cd package/mvs_widget && fvm flutter pub cache repair && fvm flutter pub get

upgrade:
	fvm flutter pub upgrade && fvm flutter pub get
	cd package/mvs_database && fvm flutter pub upgrade && fvm flutter pub get
	cd package/mvs_rest && fvm flutter pub upgrade && fvm flutter pub get
	cd package/mvs_utility && fvm flutter pub upgrade && fvm flutter pub get
	cd package/mvs_widget && fvm flutter pub upgrade && fvm flutter pub get

format:
	fvm dart format .



switch-cat:
	bash ./bin/vendor/cat/switch.sh

switch-dog:
	bash ./bin/vendor/dog/switch.sh



build-apk-cat: pre-build switch-cat
	bash ./bin/build.sh "apk" "cat"

build-appbundle-cat: pre-build switch-cat
	bash ./bin/build.sh "appbundle" "cat"

build-ipa-cat: pre-build switch-cat
	bash ./bin/build.sh "ipa" "cat"

build-linux-cat: pre-build switch-cat
	bash ./bin/build.sh "linux" "cat"

build-macos-cat: pre-build switch-cat
	bash ./bin/build.sh "macos" "cat"

build-web-cat: pre-build switch-cat
	bash ./bin/build.sh "web" "cat"

build-windows-cat: pre-build switch-cat
	bash ./bin/build.sh "windows" "cat"



build-apk-dog: pre-build switch-dog
	bash ./bin/build.sh "apk" "dog"

build-appbundle-dog: pre-build switch-dog
	bash ./bin/build.sh "appbundle" "dog"

build-ipa-dog: pre-build switch-dog
	bash ./bin/build.sh "ipa" "dog"

build-linux-dog: pre-build switch-dog
	bash ./bin/build.sh "linux" "dog"

build-macos-dog: pre-build switch-dog
	bash ./bin/build.sh "macos" "dog"

build-web-dog: pre-build switch-dog
	bash ./bin/build.sh "web" "dog"

build-windows-dog: pre-build switch-dog
	bash ./bin/build.sh "windows" "dog"