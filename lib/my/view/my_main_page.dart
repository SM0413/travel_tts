import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/view/widgets/common_sliver_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/my_main_enum.dart';
import 'package:travel_tts/my/provider/check_network_status_provider.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';

class MyMainPage extends HookConsumerWidget {
  const MyMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("MyMainPage", name: "BUILD");
    final build = useState(false);
    return CommonSliverWidget(
      slivers: [
        SliverToBoxAdapter(
          child: StreamBuilder(
            stream: ref.read(checkNetworkStatusProvider.notifier).getStream(),
            builder: (context, snapshot) {
              final result = snapshot.data;
              final connected =
                  !GlobalUtil.isEmpty(result) &&
                  result!.any((item) => item != ConnectivityResult.none);
              return ListTile(
                onTap: () {
                  build.value = !build.value;
                },
                leading: IconEnum.refresh.outline,
                title: const CommonTextWidget("인터넷 연결 상태"),
                subtitle: const CommonTextWidget(
                  "인터넷이 연결된 상태에서만 공유 또는 다운로드가 가능해요",
                  maxLines: 2,
                ),

                trailing: Switch.adaptive(
                  value: connected,
                  onChanged: null,
                  activeTrackColor: ColorUtil.primary,
                ),
              );
            },
          ),
        ),
        SliverList.builder(
          itemCount: MyMainEnum.values.length,
          itemBuilder: (context, index) {
            final item = MyMainEnum.values[index];
            return ListTile(
              onTap: () {
                RouterUtil.push(context: context, routeEnum: item.page);
              },
              leading: item.icon.rounded,
              title: CommonTextWidget(item.title),
              subtitle: CommonTextWidget(item.subTitle),
              trailing: IconEnum.rightArrow.rounded,
            );
          },
        ),
      ],
    );
  }
}
