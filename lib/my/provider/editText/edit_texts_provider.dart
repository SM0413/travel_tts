import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/my/provider/editText/edit_texts_state_provider.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class EditTextsProvider extends AutoDisposeAsyncNotifier<void> {
  late final MainPageRepo _mainPageRepo;
  @override
  FutureOr<void> build() {
    _mainPageRepo = ref.read(mainPageRepo);
  }

  Future<bool> edit({required TextsModel asisModel}) async {
    return await TryCatchUtil.handle<bool>(
          fn: () async {
            final state = ref.read(editTextsStateProvider);
            final form = state.formKey.currentState!;
            form.save();
            final Map<String, dynamic> data = Map<String, dynamic>.from(
              form.value,
            );
            final isShare = data[TextsEnum.isShare.name] ?? false;
            final isOnlinse = await NetworkUtil.isOnlineNow();
            if (isShare && !isOnlinse) {
              ToastUtil.show(title: "title");
              return false;
            }
            data.remove("tag");
            data[TextsEnum.id.name] = asisModel.id;
            data[TextsEnum.userId.name] = asisModel.userId;
            data[TextsEnum.tags.name] = state.tags;
            data[TextsEnum.updatedAt.name] = DateTime.now().toIso8601String();
            data[TextsEnum.createdAt.name] = asisModel.createdAt;
            final asisTexts = List<TextsModel>.from(
              ref.read(localDbStateProvider).value!.texts,
            );
            final existsData = asisTexts.any(
              (item) =>
                  item.pitchSpeed == data[TextsEnum.pitchSpeed.name] &&
                  item.source == data[TextsEnum.source.name] &&
                  item.target == data[TextsEnum.target.name] &&
                  item.sourceLocale == data[TextsEnum.sourceLocale.name] &&
                  item.targetLocale == data[TextsEnum.targetLocale.name] &&
                  item.isShare == data[TextsEnum.isShare.name],
            );
            if (existsData) {
              ToastUtil.show(title: "이미 저장한 내용이예요");
              return false;
            }
            if (isShare && await NetworkUtil.isOnlineNow()) {
              await _mainPageRepo.uploadTexts(data: data);
            } else if (asisModel.isShare && !isShare) {
              await _mainPageRepo.deleteTexts(model: asisModel);
            }

            final text = TextsModel.fromJson(data);
            final localIndex = asisTexts.indexWhere(
              (item) => item.id == asisModel.id,
            );
            asisTexts[localIndex] = text;
            ref.read(localDbStateProvider.notifier).setState(texts: asisTexts);
            final mainPageTexts = List<TextsModel>.from(
              ref.read(mainPageStateProvider).myTexts,
            );
            final mainDataIndex = mainPageTexts.indexWhere(
              (item) => item.id == asisModel.id,
            );
            mainPageTexts[mainDataIndex] = text;
            ref
                .read(mainPageStateProvider.notifier)
                .setState(myTexts: mainPageTexts);
            ref
                .read(editTextsStateProvider.notifier)
                .setState(isFinished: true);
            return true;
          },
          isShowToast: true,
          fnName: "edit_texts_provider > edit",
          userId: ref.read(userStateProvider).id,
          failFn: (e) => GlobalUtil.failFn(ref: ref, e: e),
        ) ??
        false;
  }
}

final editTextsProvider =
    AutoDisposeAsyncNotifierProvider<EditTextsProvider, void>(
      EditTextsProvider.new,
    );
