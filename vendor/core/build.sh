folderName=$1
buildType=$2

bash ./vendor/$folderName/switch.sh

dart run build_runner build --delete-conflicting-outputs

flutter build $buildType ./lib/main/main_$folderName.dart --release --obfuscate --split-debug-info=./split_debug_info