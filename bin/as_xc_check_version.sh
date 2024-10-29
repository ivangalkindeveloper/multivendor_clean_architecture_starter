#!/bin/bash

XCODE_VERSION=$1
ANDROID_STUDIO_VERSION=$2

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NOCOLOR='\033[0m'

ANDROID_STUDIO_INSTALLED_VERSION=$(defaults read /Applications/Android\ Studio.app/Contents/Info.plist CFBundleVersion)
if [[ "$ANDROID_STUDIO_INSTALLED_VERSION" != *"$ANDROID_STUDIO_VERSION"* ]]; then
    echo -e $YELLOW"Android Studio recommended version: $ANDROID_STUDIO_VERSION"$NOCOLOR
else
    echo -e $GREEN"Android Studio version: $ANDROID_STUDIO_VERSION"$NOCOLOR
fi

XCODE_INSTALLED_VERSION=$(xcodebuild -version | head -n 1 | cut -d ' ' -f 2)
if [[ "$XCODE_INSTALLED_VERSION" != *"$XCODE_VERSION"* ]]; then
    echo -e $YELLOW"Xcode recommended version: $XCODE_VERSION."$NOCOLOR
else
    echo -e $GREEN"Xcode version: $XCODE_VERSION"$NOCOLOR
fi