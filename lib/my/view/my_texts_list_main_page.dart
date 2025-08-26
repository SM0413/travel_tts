import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_error_widget.dart';
import 'package:travel_tts/common/view/widgets/common_no_data_widget.dart';
import 'package:travel_tts/common/view/widgets/common_scaffold_widget.dart';
import 'package:travel_tts/common/view/widgets/common_sliver_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/constructs/router_param_const.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/my/provider/my_texts_list_main_page_provider.dart';
import 'package:travel_tts/my/provider/my_texts_list_main_page_state_provider.dart';
import 'package:travel_tts/utils/alert_util.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';

class MyTextsListMainPage extends HookConsumerWidget {
  const MyTextsListMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncLocal = ref.watch(localDbStateProvider);
    final state = ref.watch(myTextsListMainPageStateProvider);

    return CommonScaffoldWidget(
      appBar: AppBar(
        title: CommonTextWidget("나의 번역${state.isDelete ? " 삭제" : ""}"),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(myTextsListMainPageStateProvider.notifier)
                  .setState(
                    deleteModelList: [],
                    isDelete: !state.isDelete,
                    isCheckAll: false,
                  );
            },
            icon: state.isDelete
                ? IconEnum.close.rounded
                : IconEnum.edit.outline,
          ),
          if (state.isDelete)
            IconButton(
              onPressed: () async {
                if (GlobalUtil.isEmpty(state.deleteModelList)) return;
                await AlertUtil.show(
                  context: context,
                  content: state.isCheckAll
                      ? "정말 전체 번역을 삭제하시겠어요?"
                      : "정말 ${state.deleteModelList.length}개의 번역을 삭제하시겠어요?",
                  confirmFn: () async {
                    await ref
                        .read(myTextsListMainPageProvider.notifier)
                        .deleteText();
                  },
                );
              },
              icon: IconEnum.delete.outline,
            ),
        ],
      ),
      body: asyncLocal.when(
        loading: () => const CommonSliverWidget(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
        error: (error, stackTrace) => const CommonSliverWidget(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: CommonErrorWidget(),
            ),
          ],
        ),
        data: (local) {
          final textList = local.texts;
          if (GlobalUtil.isEmpty(textList)) {
            return const CommonSliverWidget(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: CommonNoDataWidget(),
                ),
              ],
            );
          }

          return CommonSliverWidget(
            slivers: [
              if (state.isDelete)
                SliverToBoxAdapter(
                  child: ListTile(
                    trailing: Checkbox(
                      value: state.isCheckAll,
                      onChanged: (value) {
                        if (value == null) return;
                        List<TextsModel> deleteModelList = [];
                        if (value) {
                          deleteModelList = textList;
                        }
                        ref
                            .read(myTextsListMainPageStateProvider.notifier)
                            .setState(
                              deleteModelList: deleteModelList,
                              isCheckAll: value,
                            );
                      },
                    ),
                  ),
                ),

              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final text = textList[index];
                  return Dismissible(
                    background: Container(
                      color: ColorUtil.error,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: IconEnum.delete.withOutlineColor(
                            color: ColorUtil.white,
                          ),
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: ColorUtil.error,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconEnum.delete.withOutlineColor(
                            color: ColorUtil.white,
                          ),
                        ),
                      ),
                    ),

                    key: Key(text.id),
                    confirmDismiss: (direction) async {
                      return await AlertUtil.show(
                        context: context,
                        content: "해당 번역을 삭제하시겠어요?",
                        confirmFn: () async {
                          await ref
                              .read(myTextsListMainPageProvider.notifier)
                              .deleteSingle(model: text);
                        },
                      );
                    },
                    child: ListTile(
                      onTap: () {
                        RouterUtil.push(
                          context: context,
                          routeEnum: RouterEnum.editTexts,
                          data: {
                            RouterParamConst.json: jsonEncode(text.toJson()),
                          },
                        );
                      },
                      leading: Column(
                        spacing: 5,
                        children: [
                          IconEnum.trans.rounded,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CommonTextWidget(
                                "${text.sourceLocale} > ${text.targetLocale}",
                              ),
                            ],
                          ),
                        ],
                      ),
                      title: CommonTextWidget(text.source),
                      subtitle: CommonTextWidget(text.target),
                      trailing: state.isDelete
                          ? Checkbox(
                              value: state.deleteModelList.contains(text),
                              onChanged: (value) {
                                if (value == null) return;
                                ref
                                    .read(
                                      myTextsListMainPageStateProvider.notifier,
                                    )
                                    .setDeleteModelList(model: text);
                              },
                            )
                          : IconEnum.rightArrow.rounded,
                    ),
                  );
                }, childCount: textList.length),
              ),
            ],
          );
        },
      ),
    );
  }
}
