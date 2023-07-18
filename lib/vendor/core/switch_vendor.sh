folderName=$1
applicationName=$2
androidPackage=$3
bundleID=$4
splashColor=$5
splashColorDark=$6
splashColorAndroid12=$7
splashColorAndroid12Dark=$8
splashIconColorAndroid12=$9
splashIconColorAndroid12Dark=$10
# facebookApplicationId=$11
# facebookClientToken=$12



Green='\033[0;32m'
Yellow='\033[0;33m'
NoColor='\033[0m'

echo -e $Green"Switch vendor: $applicationName - Start"$NoColor
echo -e ""

echo -e $Yellow"Switch Android package: $androidPackage - Start"$NoColor
# Android MainActivity.kt
currentAndroidPackage=$(grep -o 'package="[^"]\+"' android/app/src/debug/AndroidManifest.xml | cut -d'"' -f2)
currentAndroidPackageList=(${currentAndroidPackage//./ })
androidPackageList=(${androidPackage//./ })
oldDirectory="android/app/src/main/kotlin/${currentAndroidPackageList[0]}/${currentAndroidPackageList[1]}/${currentAndroidPackageList[2]}"
newDirectory="android/app/src/main/kotlin/${androidPackageList[0]}/${androidPackageList[1]}/${androidPackageList[2]}"
if [[ $currentAndroidPackage != $androidPackage ]]
then
    if [[ ! -d "android/app/src/main/kotlin/${androidPackageList[0]}" ]]
    then
        mkdir "android/app/src/main/kotlin/${androidPackageList[0]}"
    fi
    if [[ ! -d "android/app/src/main/kotlin/${androidPackageList[0]}/${androidPackageList[1]}" ]]
    then
        mkdir "android/app/src/main/kotlin/${androidPackageList[0]}/${androidPackageList[1]}"
    fi
    if [[ ! -d "android/app/src/main/kotlin/${androidPackageList[0]}/${androidPackageList[1]}/${androidPackageList[2]}" ]]
    then
        mkdir "android/app/src/main/kotlin/${androidPackageList[0]}/${androidPackageList[1]}/${androidPackageList[2]}"
    fi
    cp -r $oldDirectory/MainActivity.kt $newDirectory

    rm -rf $oldDirectory/MainActivity.kt
    if [[ ${currentAndroidPackageList[2]} != ${androidPackageList[2]} ]]
    then
        rm -rf "android/app/src/main/kotlin/${currentAndroidPackageList[0]}/${currentAndroidPackageList[1]}/${currentAndroidPackageList[2]}"
    fi
    if [[ ${currentAndroidPackageList[1]} != ${androidPackageList[1]} ]]
    then
        rm -rf "android/app/src/main/kotlin/${currentAndroidPackageList[0]}/${currentAndroidPackageList[1]}"
    fi
    if [[ ${currentAndroidPackageList[0]} != ${androidPackageList[0]} ]]
    then
        rm -rf "android/app/src/main/kotlin/${currentAndroidPackageList[0]}"
    fi
fi
gsed -i "/package/c\package $androidPackage" $newDirectory/MainActivity.kt
# Android Debug AndroidManifest
gsed -i "/package=/c\    package=\"$androidPackage\">" android/app/src/debug/AndroidManifest.xml
# Android Main AndroidManifest
gsed -i "/package=/c\    package=\"$androidPackage\">" android/app/src/main/AndroidManifest.xml
gsed -i "/<activity/{n;s/.*/            android:name=\"$androidPackage.MainActivity\"/}" android/app/src/main/AndroidManifest.xml
# Android Profile AndroidManifest
gsed -i "/package=/c\    package=\"$androidPackage\">" android/app/src/profile/AndroidManifest.xml
# Android Gradle ApplicationId
gsed -i "/applicationId/c\        applicationId \"$androidPackage\"" android/app/build.gradle
echo -e $Yellow"Switch Android package: $androidPackage - Success"$NoColor
echo ""

echo -e $Yellow"Switch iOS bundleID: $bundleID - Success"$NoColor
gsed -i "/PRODUCT_BUNDLE_IDENTIFIER/c\				PRODUCT_BUNDLE_IDENTIFIER = $bundleID;" ios/Runner.xcodeproj/project.pbxproj
echo -e $Yellow"Switch iOS bundleID: $bundleID - Success"$NoColor
echo ""

echo -e $Yellow"Switch application name: $applicationName - Start"$NoColor
# Android Main AndroidManifest
gsed -i "/android:label=/c\        android:label=\"$applicationName\"" android/app/src/main/AndroidManifest.xml
# iOS Info.plist
gsed -i "/<key>CFBundleDisplayName<\/key>/{n;s/<string>.*<\/string>/<string>$applicationName<\/string>/}" ios/Runner/Info.plist
gsed -i "/<key>CFBundleName<\/key>/{n;s/<string>.*<\/string>/<string>$applicationName<\/string>/}" ios/Runner/Info.plist
echo -e $Yellow"Switch application name: $applicationName - Success"$NoColor
echo ""

echo -e $Yellow"Switch application icon - Start"$NoColor
rm -f ./asset/icon/icon.png
cp vendor/$folderName/icon.png asset/icon/icon.png
dart run flutter_launcher_icons
echo -e $Yellow"Switch application icon - Success"$NoColor
echo ""

echo -e $Yellow"Switch application splash screen - Start"$NoColor
# Color
splashConfigIndex=$(grep -n "flutter_native_splash:" flutter_native_splash.yaml| sed '1!d' | cut -d: -f1)
splashColorIndex=$((splashConfigIndex + 1))
splashColorDarkIndex=$((splashConfigIndex + 2))
gsed -i "${splashColorIndex}s/.*/  color: \"$splashColor\"/" flutter_native_splash.yaml
gsed -i "${splashColorDarkIndex}s/.*/  color_dark: \"$splashColorDark\"/" flutter_native_splash.yaml
# Background
rm -f ./asset/splash/splash_background.png
cp vendor/$folderName/splash_background.png asset/splash/splash_background.png
rm -f ./asset/splash/splash_background_dark.png
cp vendor/$folderName/splash_background_dark.png asset/splash/splash_background_dark.png
# Logo
rm -f ./asset/splash/splash_logo.png
cp vendor/$folderName/splash_logo.png asset/splash/splash_logo.png
rm -f ./asset/splash/splash_logo_dark.png
cp vendor/$folderName/splash_logo_dark.png asset/splash/splash_logo_dark.png
# Android 12
# Android 12 / Color
splashAndroid12Index=$(grep -n "android_12" flutter_native_splash.yaml| sed '1!d' | cut -d: -f1)
splashColorAndroid12Index=$(($splashAndroid12Index + 1))
splashColorAndroid12DarkIndex=$(($splashAndroid12Index + 2))
gsed -i "${splashColorAndroid12Index}s/.*/    color: \"$splashColorAndroid12\"/" flutter_native_splash.yaml
gsed -i "${splashColorAndroid12DarkIndex}s/.*/    color_dark: \"$splashColorAndroid12Dark\"/" flutter_native_splash.yaml
# Android 12 / Logo Background Color
gsed -i "/icon_background_color=/c\  icon_background_color: \"$splashIconColorAndroid12\"/" flutter_native_splash.yaml
gsed -i "/icon_background_color_dark=/c\  icon_background_color_dark: \"$splashIconColorAndroid12Dark\"/" flutter_native_splash.yaml
# Android 12 / Logo
rm -f ./asset/splash/splash_logo_android_12.png
cp vendor/$folderName/splash_logo_android_12.png asset/splash/splash_logo_android_12.png
rm -f ./asset/splash/splash_logo_android_12_dark.png
cp vendor/$folderName/splash_logo_android_12_dark.png asset/splash/splash_logo_android_12_dark.png
dart run flutter_native_splash:create
echo -e $Yellow"Switch application splash screen - Success"$NoColor
echo ""

echo -e $Yellow"Switch Firebase Analytics - Start"$NoColor
rm -f android/app/google-services.json
cp vendor/$folderName/google-services.json android/app/google-services.json
rm -f ios/Runner/GoogleService-Info.plist
cp vendor/$folderName/GoogleService-Info.plist ios/Runner/GoogleService-Info.plist
echo -e $Yellow"Switch Firebase Analytics - Success"$NoColor
echo ""

# Example for Facebook Events

# echo -e $Yellow"Switch Facebook Events - Start"$NoColor
# # Android Values String
# gsed -i "/facebook_app_id/c\    <string name=\"facebook_app_id\">$facebookApplicationId</string>" android/app/src/main/res/values/strings.xml
# gsed -i "/facebook_client_token/c\    <string name=\"facebook_client_token\">$facebookClientToken</string>" android/app/src/main/res/values/strings.xml
# # iOS Info.plist
# gsed -i "/fb/c\                     <string>fb${facebookApplicationId}</string>" ios/Runner/Info.plist
# gsed -i "/<key>FacebookAppID<\/key>/{n;s/<string>.*<\/string>/<string>$facebookApplicationId<\/string>/}" ios/Runner/Info.plist
# gsed -i "/<key>FacebookClientToken<\/key>/{n;s/<string>.*<\/string>/<string>$facebookClientToken<\/string>/}" ios/Runner/Info.plist
# gsed -i "/<key>FacebookDisplayName<\/key>/{n;s/<string>.*<\/string>/<string>$applicationName<\/string>/}" ios/Runner/Info.plist
# echo -e $Yellow"Switch Facebook Events - Success"$NoColor
# echo ""

# Example for Freshchat

# echo -e $Yellow"Switch Freshchat - Start"$NoColor
# gsed -i "/freshchat_file_provider_authority/c\    <string name=\"freshchat_file_provider_authority\">$androidPackage.provider</string>" android/app/src/main/res/values/strings.xml
# echo -e $Yellow"Switch Freshchat - Success"$NoColor
# echo ""

flutter clean
flutter pub get
echo -e ""

echo -e $Green"Switch vendor: $applicationName - Success"$NoColor
