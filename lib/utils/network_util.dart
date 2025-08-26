import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:travel_tts/utils/toast_util.dart';

abstract class NetworkUtil {
  static final conn = Connectivity();
  static final _net = InternetConnection();

  // 1) 현재 상태 단발성 체크
  static Future<bool> isOnlineNow({bool isShowToast = false}) async {
    final types = await conn.checkConnectivity(); // List<ConnectivityResult>
    final reachable = await _net.hasInternetAccess; // 실제 인터넷 가능 여부
    final hasLink = types.any((t) => t != ConnectivityResult.none);
    final result = hasLink && reachable;
    if (isShowToast && !result) {
      ToastUtil.show(title: "인터넷 연결 상태를 확인해주세요");
    }
    return result;
  }
}
