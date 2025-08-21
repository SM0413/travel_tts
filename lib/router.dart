import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_tts/common/view/widgets/common_error_widget.dart';
import 'package:travel_tts/constructs/router_param_const.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/init/view/init_main_page.dart';
import 'package:travel_tts/main/provider/upload_texts_state_provider.dart';
import 'package:travel_tts/main/view/upload_texts_main_page.dart';
import 'package:travel_tts/navigation/provider/navigation_state_provider.dart';
import 'package:travel_tts/navigation/view/navigation_main_page.dart';
import 'package:travel_tts/utils/alert_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/toast_util.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    redirect: (context, state) {
      // 토스트 메세지가 있을 경우
      final toastTitle = RouterUtil.getParameter(
        state: state,
        key: RouterParamConst.toastTitle,
      );

      if (!GlobalUtil.isEmpty(toastTitle)) {
        final toastSubTitle = RouterUtil.getParameter(
          state: state,
          key: RouterParamConst.toastSubTitle,
        );
        final toastBgColor = RouterUtil.getParameter(
          state: state,
          key: RouterParamConst.toastBgColor,
        )?.split("|");
        final toastTextColor = RouterUtil.getParameter(
          state: state,
          key: RouterParamConst.toastTextColor,
        )?.split("|");

        Future.delayed(
          const Duration(milliseconds: 500),
          () => ToastUtil.show(
            title: toastTitle!,
            subTitle: GlobalUtil.isEmpty(toastSubTitle) ? null : toastSubTitle,
            bgColor: !GlobalUtil.isEmpty(toastBgColor)
                ? Color.from(
                    alpha: double.parse(toastBgColor![0]),
                    red: double.parse(toastBgColor[1]),
                    green: double.parse(toastBgColor[2]),
                    blue: double.parse(toastBgColor[3]),
                  )
                : Colors.white,
            textColor: !GlobalUtil.isEmpty(toastTextColor)
                ? Color.from(
                    alpha: double.parse(toastTextColor![0]),
                    red: double.parse(toastTextColor[1]),
                    green: double.parse(toastTextColor[2]),
                    blue: double.parse(toastTextColor[3]),
                  )
                : Colors.black,
          ),
        );
      }
      return null;
    },
    observers: [BotToastNavigatorObserver()],
    initialLocation: RouterEnum.init.path,
    routes: [
      GoRoute(
        path: RouterEnum.init.path,
        name: RouterEnum.init.name,
        builder: (context, state) => const InitMainPage(),
      ),
      GoRoute(
        path: RouterEnum.navigation.path,
        name: RouterEnum.navigation.name,
        builder: (context, state) => const NavigationMainPage(),
        routes: [
          GoRoute(
            path: RouterEnum.uploadTexts.path,
            name: RouterEnum.uploadTexts.name,
            pageBuilder: (context, state) {
              final source = RouterUtil.getParameter(
                state: state,
                key: RouterParamConst.source,
              );
              return _commonFadeBuilder(
                state: state,
                child: UploadTextsMainPage(source: source),
              );
            },
            onExit: (context, state) async {
              final confirm = await _commonLeavePage(
                context: context,
                isFinished: ref.read(uploadTextsStateProvider).isFinished,
              );

              if (!confirm) {
                ref
                    .read(navigationStateProvider.notifier)
                    .setState(selectedIndex: 0);
              }
              return confirm;
            },
          ),
        ],
      ),
    ],
  );
});

// ignore: unused_element
Widget _commonNoDataWidget({String? subTitle}) {
  return Scaffold(
    body: Center(child: CommonErrorWidget(subTitle: subTitle ?? "필수값이 없어요")),
  );
}

Future<bool> _commonLeavePage({
  required BuildContext context,
  required bool isFinished,
}) async {
  if (isFinished) return true;
  return await AlertUtil.show(
    title: "확인해주세요",
    content: "지금 나가면 작성한 내용이 삭제돼요\n정말 나가시겠어요?",
    context: context,
    confirmFn: () {},
  );
}

dynamic _commonFadeBuilder({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
