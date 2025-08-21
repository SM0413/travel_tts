import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkUtil {
  static final _conn = Connectivity();
  static final _net = InternetConnection();

  // 1) 현재 상태 단발성 체크
  static Future<bool> isOnlineNow() async {
    final types = await _conn.checkConnectivity(); // List<ConnectivityResult>
    final reachable = await _net.hasInternetAccess; // 실제 인터넷 가능 여부
    final hasLink = types.any((t) => t != ConnectivityResult.none);
    return hasLink && reachable;
  }
}
