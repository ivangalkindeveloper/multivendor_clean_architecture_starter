title=$1
folderName=$2
applicationName=$3
splashColor=$4
package=$5
facebookApplicationId=$6
facebookClientToken=$7

Green='\033[0;32m'
Yellow='\033[0;33m'
NoColor='\033[0m'

echo -e ${Green}"Switch vendor $title - Start"${NoColor}
echo -e ""

echo -e ${Yellow}"Switch application name: $applicationName - Start"${NoColor}
# Android Main AndroidManifest
gsed -i "/android:label=/c\        android:label=\"$applicationName\"" android/app/src/main/AndroidManifest.xml
# iOS Info.plist
gsed -i "/<key>CFBundleDisplayName<\/key>/{n;s/<string>.*<\/string>/<string>$applicationName<\/string>/}" ios/Runner/Info.plist
gsed -i "/<key>CFBundleName<\/key>/{n;s/<string>.*<\/string>/<string>$applicationName<\/string>/}" ios/Runner/Info.plist
echo -e ${Yellow}"Switch application name: $applicationName - Success"${NoColor}
echo ""

echo -e ${Yellow}"Switch Android package and iOS bundleID - Start"${NoColor}
# Android MainActivity.kt
currentAndroidPackage=$(grep -o 'package="[^"]\+"' android/app/src/debug/AndroidManifest.xml | cut -d'"' -f2)
currentAndroidPackageList=(${currentAndroidPackage//./ })
androidPackageList=(${package//./ })
oldDirectory="android/app/src/main/kotlin/${currentAndroidPackageList[0]}/${currentAndroidPackageList[1]}/${currentAndroidPackageList[2]}"
newDirectory="android/app/src/main/kotlin/${androidPackageList[0]}/${androidPackageList[1]}/${androidPackageList[2]}"
if [[ $currentAndroidPackage != $package ]]
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
gsed -i "/package/c\package $package" $newDirectory/MainActivity.kt
# Android Debug AndroidManifest
gsed -i "/package=/c\    package=\"$package\">" android/app/src/debug/AndroidManifest.xml
# Android Main AndroidManifest
gsed -i "/package=/c\    package=\"$package\">" android/app/src/main/AndroidManifest.xml
gsed -i "/<activity/{n;s/.*/            android:name=\"$package.MainActivity\"/}" android/app/src/main/AndroidManifest.xml
# Android Profile AndroidManifest
gsed -i "/package=/c\    package=\"$package\">" android/app/src/profile/AndroidManifest.xml
# Android Gradle ApplicationId
gsed -i "/applicationId/c\        applicationId \"$package\"" android/app/build.gradle
# iOS BundleID
gsed -i "/PRODUCT_BUNDLE_IDENTIFIER/c\				PRODUCT_BUNDLE_IDENTIFIER = $package;" ios/Runner.xcodeproj/project.pbxproj
echo -e ${Yellow}"Switch Android package and iOS bundleID - Success"${NoColor}
echo ""

echo -e ${Yellow}"Switch application icon - Start"${NoColor}
rm -f ./asset/application_icon/application_icon.png
cp vendor/application_icon/$folderName.png asset/application_icon/application_icon.png
dart run flutter_launcher_icons:main
echo -e ${Yellow}"Switch application icon - Success"${NoColor}
echo ""

echo -e ${Yellow}"Switch application splash screen - Start"${NoColor}
rm -f ./asset/application_splash/application_splash.png
cp vendor/application_splash/$folderName.png asset/application_splash/application_splash.png
gsed -i "/color:/c\  color: \"$splashColor\"" pubspec.yaml
dart run flutter_native_splash:create
echo -e ${Yellow}"Switch application splash screen - Success"${NoColor}
echo ""

echo -e ${Yellow}"Switch Firebase Analytics - Start"${NoColor}
rm -f android/app/google-services.json
cp vendor/firebase_analytics/android/google-services-$folderName.json android/app/google-services.json
rm -f ios/Runner/GoogleService-Info.plist
cp vendor/firebase_analytics/ios/GoogleService-Info-$folderName.plist ios/Runner/GoogleService-Info.plist
echo -e ${Yellow}"Switch Firebase Analytics - Success"${NoColor}
echo ""

# echo -e ${Yellow}"Switch Facebook Events - Start"${NoColor}
# # Android Values String
# gsed -i "/facebook_app_id/c\    <string name=\"facebook_app_id\">$facebookApplicationId</string>" android/app/src/main/res/values/strings.xml
# gsed -i "/facebook_client_token/c\    <string name=\"facebook_client_token\">$facebookClientToken</string>" android/app/src/main/res/values/strings.xml
# # iOS Info.plist
# gsed -i "/fb/c\                     <string>fb${facebookApplicationId}</string>" ios/Runner/Info.plist
# gsed -i "/<key>FacebookAppID<\/key>/{n;s/<string>.*<\/string>/<string>$facebookApplicationId<\/string>/}" ios/Runner/Info.plist
# gsed -i "/<key>FacebookClientToken<\/key>/{n;s/<string>.*<\/string>/<string>$facebookClientToken<\/string>/}" ios/Runner/Info.plist
# gsed -i "/<key>FacebookDisplayName<\/key>/{n;s/<string>.*<\/string>/<string>$applicationName<\/string>/}" ios/Runner/Info.plist
# echo -e ${Yellow}"Switch Facebook Events - Success"${NoColor}
# echo ""

# echo -e ${Yellow}"Switch Freshchat - Start"${NoColor}
# gsed -i "/freshchat_file_provider_authority/c\    <string name=\"freshchat_file_provider_authority\">$package.provider</string>" android/app/src/main/res/values/strings.xml
# echo -e ${Yellow}"Switch Freshchat - Success"${NoColor}
# echo ""

flutter clean
flutter pub get
echo -e ""

echo -e ${Green}"Switch vendor $title - Success"${NoColor}
