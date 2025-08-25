import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_inkwell_widget.dart';
import 'package:travel_tts/common/view/widgets/common_no_data_widget.dart';
import 'package:travel_tts/common/view/widgets/common_sliver_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/constructs/router_param_const.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/main/provider/main_page_provider.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/view/texts_info_bottom_sheet.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/size_util.dart';
import 'package:travel_tts/utils/text_util.dart';
import 'package:travel_tts/utils/tts_util.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainPageStateProvider);
    final localDbState = ref.watch(localDbStateProvider).value;
    final isLoading = ref.watch(mainPageProvider).isLoading;
    final playId = useState<String?>(null);
    final userId = ref.watch(userStateProvider).id;
    final favoriteSet = useMemoized(
      () => (localDbState?.favoriteList ?? const <String>[]).toSet(),
      [localDbState?.favoriteList],
    );
    useListenable(state.searchController); // 검색어 변경 시 위젯 리빌드 트리거

    final query = state.searchController.text.trim().toLowerCase();

    // 최초 인입 시
    useEffect(() {
      RouterUtil.waitBuild(
        fn: () async {
          await ref.read(mainPageProvider.notifier).getData();
        },
      );
      return null;
    }, []);

    // 검색어/데이터가 바뀔 때만 필터링 재계산 (성능 최적화)
    final sortedItems = useMemoized(() {
      if (GlobalUtil.isEmpty(query)) {
        return [...state.myTexts]..sort((a, b) {
          final aFav = localDbState.favoriteList.contains(a.id);
          final bFav = localDbState.favoriteList.contains(b.id);
          if (aFav == bFav) return 0;
          return aFav ? -1 : 1;
        });
      }

      final filtered = state.myTexts
          .where(
            (t) =>
                t.source.toString().toLowerCase().contains(query) ||
                t.target.toString().toLowerCase().contains(query) ||
                t.tags.any(
                  (tag) => tag.toString().toLowerCase().contains(query),
                ) ||
                t.sourceLocale.toString().toLowerCase().contains(query) ||
                t.targetLocale.toString().toLowerCase().contains(query),
          )
          .toList();

      filtered.sort((a, b) {
        final aFav = localDbState.favoriteList.contains(a.id);
        final bFav = localDbState.favoriteList.contains(b.id);
        if (aFav == bFav) return 0;
        return aFav ? -1 : 1;
      });
      if (GlobalUtil.isEmpty(filtered)) return [].cast<TextsModel>();
      return filtered;
    }, [query, state.myTexts, localDbState!.favoriteList]);

    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(mainPageProvider.notifier).getData();
      },
      child: CommonSliverWidget(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SearchBar(
                      controller: state.searchController,
                      focusNode: state.searchFocus,
                      keyboardType: TextInputType.text,
                      hintText: "검색",
                      leading: IconEnum.search.outline,
                      trailing: [
                        IconButton(
                          onPressed: () {
                            state.searchController.clear();
                          },
                          icon: IconEnum.close.outline,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await TtsUtil.stop();
                    RouterUtil.push(
                      context: context,
                      routeEnum: RouterEnum.uploadTexts,
                      data: {
                        RouterParamConst.source: state.searchController.text
                            .trim(),
                      },
                    );
                  },
                  icon: const Icon(Icons.add_outlined),
                ),
              ],
            ),
          ),

          const SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          ),

          if (GlobalUtil.isEmpty(sortedItems))
            SliverFillRemaining(
              hasScrollBody: false,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : const CommonNoDataWidget(),
            ),

          if (!GlobalUtil.isEmpty(sortedItems))
            SliverGrid.builder(
              itemCount: sortedItems.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 3 : 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                mainAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                final text = sortedItems[index];
                final isPlay = playId.value == text.id;
                final isMyText = text.userId == userId;
                final isFavorite = favoriteSet.contains(text.id);
                return Skeletonizer(
                  enabled: isLoading,
                  child: CommonInkwellWidget(
                    tooltip: "상세페이지",
                    onTap: () async {
                      await TtsUtil.stop();
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        useSafeArea: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (ctx) {
                          return TextsInfoBottomSheet(state: text);
                        },
                      );
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: CommonTextWidget(
                                  text.source,
                                  maxLines: 1,
                                  style: TextUtil.textTheme(context).bodyLarge,
                                  isBold: true,
                                ),
                                subtitle: CommonTextWidget(
                                  text.target,
                                  maxLines: 1,
                                  style: TextUtil.textTheme(context).bodyMedium,
                                ),
                                trailing: null,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  16,
                                  0,
                                  16,
                                  8,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.translate, size: 18),
                                        const SizedBox(width: 6),
                                        Flexible(
                                          child: CommonTextWidget(
                                            '${text.sourceLocale} → ${text.targetLocale}',
                                            maxLines: 1,
                                            style: TextUtil.textTheme(
                                              context,
                                            ).labelLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizeUtil.basicHPadding(height: 6),
                                    Row(
                                      children: [
                                        const Icon(Icons.speed, size: 18),
                                        const SizedBox(width: 6),
                                        CommonTextWidget(
                                          '속도: ${((text.pitchSpeed) as num).toDouble().toStringAsFixed(1)}x',
                                          style: TextUtil.textTheme(
                                            context,
                                          ).labelLarge,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CommonInkwellWidget(
                                    tooltip: "번역 음성 ${isPlay ? "정지" : "재생"}",
                                    onTap: () async {
                                      if (isPlay) {
                                        playId.value = null;
                                        await TtsUtil.stop();
                                      } else {
                                        if (playId.value != null) {
                                          await TtsUtil.stop();
                                          await Future.delayed(
                                            const Duration(milliseconds: 200),
                                          );
                                        }
                                        playId.value = text.id;
                                        await TtsUtil.play(
                                          value: text.target,
                                          speed: text.pitchSpeed,
                                          transEnum: TransEnum.values
                                              .firstWhere(
                                                (item) =>
                                                    item.ko ==
                                                    text.targetLocale,
                                              ),
                                        ).then((value) {
                                          playId.value = null;
                                        });
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: SizeUtil.basicRadius(),
                                        color: isLoading
                                            ? null
                                            : ColorUtil.withOpacity(
                                                color: ColorUtil.primary,
                                                opacity: 30,
                                              ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          isPlay
                                              ? IconEnum.stop.rounded
                                              : IconEnum.play.outline,
                                          CommonTextWidget(
                                            isPlay ? "정지" : "재생",
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      ref
                                          .read(localDbStateProvider.notifier)
                                          .setFavorite(id: text.id);
                                    },
                                    icon: isFavorite
                                        ? IconEnum.favorite.rounded
                                        : IconEnum.favorite.outline,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (isMyText)
                          Positioned(
                            top: 6,
                            right: 6,
                            child: IconEnum.person.withRoundedColor(
                              color: Colors.amber,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
