import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_app_bar_widget.dart';
import 'package:travel_tts/common/view/widgets/common_scaffold_widget.dart';
import 'package:travel_tts/common/view/widgets/common_sliver_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/download/provider/download_main_page_provider.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/utils/alert_util.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/toast_util.dart';

class DownloadMainPage extends HookConsumerWidget {
  const DownloadMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localDbState = ref.watch(localDbStateProvider).value!;
    final isDownLoadedAll = useState<bool>(false);

    useEffect(() {
      if (!context.mounted) return;
      isDownLoadedAll.value =
          localDbState.downloadedLangPack.length == TransEnum.values.length;
      return null;
    }, [localDbState.downloadedLangPack]);

    useEffect(() {
      RouterUtil.waitBuild(
        fn: () async {
          await NetworkUtil.isOnlineNow(isShowToast: true);
          if (!context.mounted) return;
          isDownLoadedAll.value =
              localDbState.downloadedLangPack.length == TransEnum.values.length;
        },
      );
      return null;
    }, []);
    return CommonScaffoldWidget(
      appBar: CommonAppBarWidget(
        title: const CommonTextWidget("다운로드"),
        actions: [
          Tooltip(
            message: isDownLoadedAll.value ? "전체 언어 팩 삭제" : "전체 언어 팩 다운로드",
            child: IconButton(
              onPressed: () async {
                final confirm = await AlertUtil.show(
                  context: context,
                  title:
                      "전체 언어 팩을 ${isDownLoadedAll.value ? "삭제" : "다운로드"} 합니다",
                  content: isDownLoadedAll.value ? null : "최대 10분이 소요됩니다",
                  confirmFn: () async {},
                );
                if (confirm) {
                  ToastUtil.loading(() async {
                    if (isDownLoadedAll.value) {
                      await ref
                          .read(downloadMainPageProvider.notifier)
                          .deleteAllPack();
                    } else {
                      await ref
                          .read(downloadMainPageProvider.notifier)
                          .downloadAllPack();
                    }
                  });
                }
              },
              icon: IconEnum.download.rounded,
            ),
          ),
        ],
      ),
      body: CommonSliverWidget(
        slivers: [
          SliverToBoxAdapter(
            child: ExpansionTile(
              initiallyExpanded: true,
              title: const CommonTextWidget("언어 팩"),
              children: TransEnum.values.map((item) {
                final isDownloaded = localDbState.downloadedLangPack.any(
                  (localData) => localData == item.ko,
                );
                return ListTile(
                  title: CommonTextWidget(item.ko),
                  trailing: isDownloaded
                      ? IconButton(
                          onPressed: () async {
                            if (item == TransEnum.korean ||
                                item == TransEnum.english) {
                              ToastUtil.show(
                                title:
                                    "${TransEnum.korean.ko}와 ${TransEnum.english.ko}는 필수 팩 입니다",
                              );
                              return;
                            }
                            await AlertUtil.show(
                              context: context,
                              title: "${item.ko} 언어팩을 삭제하시겠어요?",
                              confirmFn: () async {
                                await ref
                                    .read(downloadMainPageProvider.notifier)
                                    .deletePack(tranEnum: item);
                              },
                            );
                          },
                          icon: IconEnum.checkCircle.withRoundedColor(
                            color: ColorUtil.success,
                          ),
                        )
                      : IconButton(
                          onPressed: () async {
                            await ToastUtil.loading(() async {
                              await ref
                                  .read(downloadMainPageProvider.notifier)
                                  .downloadPack(tranEnum: item);
                            });
                          },
                          icon: IconEnum.download.outline,
                        ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
