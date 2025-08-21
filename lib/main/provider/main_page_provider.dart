import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_provider.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/model_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class MainPageProvider extends AsyncNotifier<void> {
  late final MainPageRepo _mainPageRepo;
  @override
  FutureOr<void> build() {
    _mainPageRepo = ref.read(mainPageRepo);
  }

  Future<void> getData() async {
    return await TryCatchUtil.handle(
      fn: () async {
        List<TextsModel> result = [];
        final isConnectInternet = await NetworkUtil.isOnlineNow();
        if (isConnectInternet) {
          final res = await _mainPageRepo.getData();
          if (!GlobalUtil.isEmpty(res)) {
            result =
                ModelUtil.fromJson(fromJson: TextsModel.fromJson, json: res) ??
                [];
          }
          result.addAll(ref.read(localDbStateProvider).value?.texts ?? []);
          ref.read(mainPageStateProvider.notifier).setState(texts: result);
        }
      },
      isShowToast: true,
      fnName: "main_page_provider > getData",
    );
  }
}

final mainPageProvider = AsyncNotifierProvider<MainPageProvider, void>(
  MainPageProvider.new,
);
