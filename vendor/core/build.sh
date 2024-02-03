folderName=$1
buildType=$2

flutter build $buildType -t ./lib/main/main_$folderName.dart --release --obfuscate --split-debug-info=./split_debug_info