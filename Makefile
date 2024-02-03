repair:
	@echo "Project clean, pub repair, pub get"
	@flutter pub cache repair && flutter pub get
	@cd package/mvs_rest && flutter pub cache repair && flutter pub get
	@cd package/mvs_utility && flutter pub cache repair && flutter pub get
	@cd package/mvs_widget && flutter pub cache repair && flutter pub get

clean:
	@echo "Project clean, pub get"
	@rm -rf ~/Library/Caches/CocoaPods
	@rm -rf ~/Library/Application\ Support/Code/Cache/*
	@rm -rf ~/Library/Application\ Support/Code/CachedData/*
	@rm -rf pubspec.lock
	@flutter clean && flutter pub get
	@cd package/mvs_rest && rm -rf pubspec.lock && flutter clean && flutter pub get
	@cd package/mvs_utility && rm -rf pubspec.lock && flutter clean && flutter pub get
	@cd package/mvs_widget && rm -rf pubspec.lock && flutter clean && flutter pub get

upgrade:
	@echo "Project pub upgrade"
	@flutter pub upgrade && flutter pub get
	@cd package/mvs_rest && flutter pub upgrade && flutter pub get
	@cd package/mvs_utility && flutter pub upgrade && flutter pub get
	@cd package/mvs_widget && flutter pub upgrade && flutter pub get

pod-install:
	@echo "Project ios pod install"
	@cd ios && rm -rf Pods && rm -rf Podfile.lock && rm -rf Flutter/Flutter.podspec
	@cd ios && pod deintegrate && sudo gem uninstall cocoapods && sudo gem uninstall cocoapods-core && sudo gem uninstall cocoapods-downloader && sudo gem install cocoapods
	@cd ios && pod setup && pod install --repo-update && pod cache clean --all && pod update
	@flutter clean && flutter pub get && flutter pub cache repair && flutter pub get

build-runner:
	@find . -name \*.g.dart -type f -delete
	@dart run build_runner clean
	@dart run build_runner build --delete-conflicting-outputs

pre-build:
	clean build-runner



switch-cat:
	@bash ./vendor/cat/switch.sh

switch-dog:
	@bash ./vendor/dog/switch.sh



build-cat-apk:
	pre-build
	switch-cat
	bash ./vendor/core/build.sh "cat" "apk"

build-cat-appbundle:
	pre-build
	switch-cat
	bash ./vendor/core/build.sh "cat" "appbundle"

build-cat-ipa:
	pre-build
	switch-cat
	bash ./vendor/core/build.sh "cat" "ipa"

build-cat-linux:
	pre-build
	switch-cat
	bash ./vendor/core/build.sh "cat" "linux"

build-cat-macos:
	pre-build
	switch-cat
	bash ./vendor/core/build.sh "cat" "macos"

build-cat-web:
	pre-build
	switch-cat
	bash ./vendor/core/build.sh "cat" "web"



build-dog-apk:
	pre-build
	switch-dog
	bash ./vendor/core/build.sh "dog" "apk"

build-appbundle-dog:
	pre-build
	switch-dog
	bash ./vendor/core/build.sh "dog" "appbundle"

build-ipa-dog:
	pre-build
	switch-dog
	bash ./vendor/core/build.sh "dog" "ipa"

build-linux-dog:
	pre-build
	switch-dog
	bash ./vendor/core/build.sh "dog" "linux"

build-macos-dog:
	pre-build
	switch-dog
	bash ./vendor/core/build.sh "dog" "macos"

build-web-dog:
	pre-build
	switch-dog
	bash ./vendor/core/build.sh "dog" "web"