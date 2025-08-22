import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/main/provider/upload_texts_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class UploadTextsProvider extends AutoDisposeAsyncNotifier<void> {
  late final MainPageRepo _mainPageRepo;
  @override
  FutureOr<void> build() {
    _mainPageRepo = ref.read(mainPageRepo);
  }

  Future<void> upload() async {
    return await TryCatchUtil.handle(
      fn: () async {
        final state = ref.read(uploadTextsStateProvider);
        final isValid = state.formKey.currentState?.validate();
        if (isValid == false) return;
        final form = state.formKey.currentState!;
        form.save();
        Map<String, dynamic> data = Map<String, dynamic>.from(form.value);
        final isShare = data[TextsEnum.isShare.name] ?? false;
        data.remove("tag");
        data[TextsEnum.userId.name] = ref.read(userStateProvider).id.toString();
        data[TextsEnum.tags.name] = state.tags;
        final now = DateTime.now();
        data[TextsEnum.id.name] = StringUtil.getUUID();
        data[TextsEnum.createdAt.name] = now;
        data[TextsEnum.updatedAt.name] = now;
        final asisTexts = ref.read(localDbStateProvider).value!.texts;
        final existsData = asisTexts.any(
          (item) =>
              item.pitchSpeed == data[TextsEnum.pitchSpeed.name] &&
              item.source == data[TextsEnum.source.name] &&
              item.target == data[TextsEnum.target.name] &&
              item.sourceLocale == data[TextsEnum.sourceLocale.name] &&
              item.targetLocale == data[TextsEnum.targetLocale.name],
        );
        if (existsData) {
          ToastUtil.show(title: "이미 저장한 내용이예요");
          return;
        }

        if (isShare && await NetworkUtil.isOnlineNow()) {
          data = await _mainPageRepo.upload(data: data) ?? data;
        }

        ref
            .read(localDbStateProvider.notifier)
            .setState(
              texts: {...asisTexts, TextsModel.fromJson(data)}.toList(),
            );
      },
      isShowToast: true,
      fnName: "upload_texts_provider > upload",
      errorMessage: "정보 저장에 실패했어요",
    );
  }
}

final uploadTextsProvider =
    AutoDisposeAsyncNotifierProvider<UploadTextsProvider, void>(
      UploadTextsProvider.new,
    );
