import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

abstract class PermissionUtil {
  /// 공통 권한 요청
  static Future<bool> requestPermission({
    required Permission permission,
    required bool isOpenSettings,
    required bool isShowToast,
  }) async {
    return await TryCatchUtil.handle(
          fn: () async {
            bool isGranted = false;

            // 권한 요청
            final PermissionStatus status = await permission.request();
            if (status.isGranted || status.isLimited) {
              isGranted = true;
            } else if (status.isDenied) {
              // 권한 거부
              isGranted = false;
            } else if (status.isPermanentlyDenied) {
              // 권한 영구적으로 거부
              isGranted = false;
            }
            if (!isGranted) {
              if (isOpenSettings) {
                openAppSettings();
              } else {
                if (isShowToast) {
                  ToastUtil.show(
                    title: "권한이 없어요",
                    subTitle: "여기를 클릭해 권한을 설정해주세요",
                    bgColor: ColorUtil.warning,
                    textColor: Colors.white,
                    onTapFn: () async {
                      await openAppSettings();
                    },
                  );
                }
              }
            }

            return isGranted;
          },
          isShowToast: isShowToast,
          errorMessage: "권한 확인에 실패했어요",
          fnName: "permission_util > requestPermission",
          userId: "permissionError",
        ) ??
        false;
  }

  /// 카메라 권한 요청
  static Future<bool> cameraPermission({
    bool isOpenSettings = false,
    bool isShowToast = true,
  }) async {
    return await requestPermission(
      permission: Permission.camera,
      isOpenSettings: isOpenSettings,
      isShowToast: isShowToast,
    );
  }

  /// 마이크 권한 요청
  static Future<bool> calendarPermission({
    bool isOpenSettings = false,
    bool isShowToast = true,
  }) async {
    return await requestPermission(
      permission: Permission.calendarFullAccess,
      isOpenSettings: isOpenSettings,
      isShowToast: isShowToast,
    );
  }

  /// 사진첩 권한 요청
  static Future<bool> photosPermission({
    bool isOpenSettings = false,
    bool isShowToast = true,
  }) async {
    return await requestPermission(
      permission: Permission.photos,
      isOpenSettings: isOpenSettings,
      isShowToast: isShowToast,
    );
  }

  /// 알림 권한 요청
  static Future<bool> notificationPermission({
    bool isOpenSettings = false,
    bool isShowToast = true,
  }) async {
    return await requestPermission(
      permission: Permission.notification,
      isOpenSettings: isOpenSettings,
      isShowToast: isShowToast,
    );
  }

  /// 위치 권한 요청
  static Future<bool> locationPermission({
    bool isOpenSettings = false,
    bool isShowToast = true,
  }) async {
    return await requestPermission(
      permission: Permission.location,
      isOpenSettings: isOpenSettings,
      isShowToast: isShowToast,
    );
  }
}
