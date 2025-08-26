import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/utils/network_util.dart';

class CheckNetworkStatusProvider extends AsyncNotifier<bool> {
  @override
  FutureOr<bool> build() async {
    return await NetworkUtil.isOnlineNow();
  }

  Stream<List<ConnectivityResult>> getStream() {
    return Connectivity().onConnectivityChanged;
  }
}

final checkNetworkStatusProvider =
    AsyncNotifierProvider<CheckNetworkStatusProvider, bool>(
      CheckNetworkStatusProvider.new,
    );
