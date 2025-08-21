import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/utils/global_util.dart';

abstract class RouterUtil {
  /// 스텍형 페이지 이동
  static void push({
    required BuildContext context,
    required RouterEnum routeEnum,
    Map<String, String?>? data,
  }) {
    if (!context.mounted) return;
    context.pushNamed(routeEnum.name, extra: data);
  }

  /// 기존 스텍을 모두 지우고 페이지 이동
  static void go({
    required BuildContext context,
    required RouterEnum routeEnum,
    Map<String, String?>? data,
  }) {
    if (!context.mounted) return;
    context.goNamed(routeEnum.name, extra: data);
  }

  /// 현재 페이지 경로 가져오기
  static String getCurrentPath(BuildContext context) {
    if (!context.mounted) return "";
    return GoRouter.of(
      context,
    ).routerDelegate.currentConfiguration.routes.last.toString();
  }

  /// 현재 페이지 닫기
  static void pop(BuildContext context) {
    if (context.mounted && context.canPop()) {
      context.pop();
    }
  }

  /// 인자로 넘겨진 데이터 가져오기
  static String? getParameter({
    required GoRouterState state,
    required String key,
  }) {
    final map = state.extra as Map<String, String?>? ?? {};
    if (GlobalUtil.isEmpty(map)) return null;
    return map[key];
  }

  static void waitBuild({required Function() fn}) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await fn.call();
    });
  }
}
