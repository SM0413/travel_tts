import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_tts/common/model/local_db_model.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/repo/local_db_repo.dart';
import 'package:travel_tts/enums/db/local_db_enum.dart';
import 'package:travel_tts/utils/model_util.dart';

class LocalDbStateProvider extends AsyncNotifier<LocalDbModel> {
  late final LocalDbRepo _localDbRepo;

  @override
  FutureOr<LocalDbModel> build() async {
    _localDbRepo = LocalDbRepo(await SharedPreferences.getInstance());
    return LocalDbModel(
      texts:
          ModelUtil.fromJson(
            fromJson: TextsModel.fromJson,
            json: _localDbRepo.getStringList(key: LocalDbEnum.texts.name),
          ) ??
          [],
    );
  }

  Future<void> setState({
    List<TextsModel>? texts,
    List<String>? downloadedLangPack,
  }) async {
    final Map<String, dynamic> fields = {
      if (texts != null) LocalDbEnum.texts.name: texts,
      if (downloadedLangPack != null)
        LocalDbEnum.downloadedLangPack.name: downloadedLangPack,
    };

    await _setLocalDb(fields: fields);

    state = AsyncData(
      state.value?.copyWith(
            texts: texts ?? state.value!.texts,
            downloadedLangPack:
                downloadedLangPack ?? state.value!.downloadedLangPack,
          ) ??
          const LocalDbModel(),
    );
  }

  Future<void> _setLocalDb({required Map<String, dynamic> fields}) async {
    final List<Future<void>> futures = [];

    for (final entry in fields.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is String) {
        futures.add(_localDbRepo.setString(key: key, value: value));
      } else if (value is bool) {
        futures.add(_localDbRepo.setBool(key: key, value: value));
      } else if (value is List<String>) {
        futures.add(_localDbRepo.setStringList(key: key, value: value));
      } else if (value is int) {
        futures.add(_localDbRepo.setInt(key: key, value: value));
      } else if (value is double) {
        futures.add(_localDbRepo.setDouble(key: key, value: value));
      }
    }

    await Future.wait(futures);
  }
}

final localDbStateProvider =
    AsyncNotifierProvider<LocalDbStateProvider, LocalDbModel>(
      LocalDbStateProvider.new,
    );
