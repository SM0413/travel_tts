import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadTextsStateProvider extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}
}

final uploadTextsStateProvider =
    AutoDisposeAsyncNotifierProvider<UploadTextsStateProvider, void>(
      UploadTextsStateProvider.new,
    );
