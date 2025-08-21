import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/view/widgets/common_no_data_widget.dart';
import 'package:travel_tts/common/view/widgets/common_sliver_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/constructs/router_param_const.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/main/provider/main_page_provider.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainPageStateProvider);
    useListenable(state.searchController); // 검색어 변경 시 위젯 리빌드 트리거

    final query = state.searchController.text.trim();

    // 검색어/데이터가 바뀔 때만 필터링 재계산 (성능 최적화)
    final sortedItems = useMemoized(() {
      if (GlobalUtil.isEmpty(query)) return state.texts;

      return state.texts
          .where(
            (t) =>
                t.source.contains(query) ||
                t.target.contains(query) ||
                t.tags.any((tag) => tag.contains(query)) ||
                t.sourceLocale.contains(query) ||
                t.targetLocale.contains(query),
          )
          .toList();
    }, [query, state.texts]);
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
                  onPressed: () {
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
          SliverList.builder(
            itemCount: GlobalUtil.isEmpty(state.texts) ? 1 : sortedItems.length,
            itemBuilder: (context, index) {
              if (GlobalUtil.isEmpty(state.texts)) {
                return const CommonNoDataWidget();
              }

              final text = sortedItems[index];
              return CommonTextWidget(text.source);
            },
          ),
        ],
      ),
    );
  }
}
