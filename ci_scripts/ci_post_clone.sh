#!/bin/sh
set -euo pipefail
FLUTTER_ROOT="$HOME/flutter"
if [ ! -d "$FLUTTER_ROOT" ]; then
  git clone --depth 1 -b stable https://github.com/flutter/flutter.git "$FLUTTER_ROOT"
fi
export PATH="$FLUTTER_ROOT/bin:$PATH"

flutter --version
flutter pub get
flutter build ios --release --no-codesign   # ← Generated.xcconfig 생성

cd ios
pod install                                 # ← xcfilelist 재생성