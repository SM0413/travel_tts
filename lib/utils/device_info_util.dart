import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoUtil {
  static final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  /// 디바이스 정보를 가져온다.
  static Future<Map<String, dynamic>> getDeviceInfo() async {
    Map<String, dynamic> deviceData = {};

    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo =
            await _deviceInfoPlugin.androidInfo;
        deviceData = {
          'platform': 'Android',
          'model': androidInfo.model,
          'manufacturer': androidInfo.manufacturer,
          'androidVersion': androidInfo.version.release,
          'sdkVersion': androidInfo.version.sdkInt,
          'device': androidInfo.device,
          'id': androidInfo.id,
          'isPhysicalDevice': androidInfo.isPhysicalDevice,
        };
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await _deviceInfoPlugin.iosInfo;
        deviceData = {
          'platform': 'iOS',
          'model': iosInfo.utsname.machine,
          'systemName': iosInfo.systemName,
          'systemVersion': iosInfo.systemVersion,
          'name': iosInfo.name,
          'identifierForVendor': iosInfo.identifierForVendor,
          'isPhysicalDevice': iosInfo.isPhysicalDevice,
        };
      } else {
        deviceData = {'platform': 'Unknown', 'isPhysicalDevice': false};
      }
    } catch (e) {
      deviceData = {'error': 'Failed to get device info: $e'};
    }

    return deviceData;
  }
}
