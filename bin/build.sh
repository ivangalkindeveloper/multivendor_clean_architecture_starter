TYPE=$1
ENVIRONMENT=$2

fvm flutter build $TYPE -t ./lib/main.dart --dart-define=environment=$ENVIRONMENT --release --no-tree-shake-icons --build-number=$(date '+%y%m%d%H')