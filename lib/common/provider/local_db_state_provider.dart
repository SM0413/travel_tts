import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_tts/common/model/local_db_model.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/repo/local_db_repo.dart';
import 'package:travel_tts/enums/db/local_db_enum.dart';
import 'package:travel_tts/utils/model_util.dart';

class LocalDbStateProvider extends AsyncNotifier<LocalDbModel> {
  // Initialize repo eagerly to avoid LateInitializationError and races
  final Future<LocalDbRepo> _repoFuture = SharedPreferences.getInstance().then(
    (prefs) => LocalDbRepo(prefs),
  );

  @override
  FutureOr<LocalDbModel> build() async {
    final repo = await _repoFuture;
    final textsList = repo.getStringList(key: LocalDbEnum.texts.name);
    final errorList = repo.getStringList(key: LocalDbEnum.errorList.name);

    return LocalDbModel(
      texts:
          ModelUtil.fromJson(
            fromJson: TextsModel.fromJson,
            json: textsList?.map((item) => jsonDecode(item)).toList(),
          ) ??
          [],
      downloadedLangPack:
          repo.getStringList(key: LocalDbEnum.downloadedLangPack.name) ??
          ["한국어", "영어"],
      favoriteList:
          repo.getStringList(key: LocalDbEnum.favoriteList.name) ?? [],
      errorList:
          errorList
              ?.map((item) => jsonDecode(item))
              .toList()
              .cast<Map<String, dynamic>>() ??
          [],
      uid: repo.getString(key: LocalDbEnum.uid.name) ?? "",
    );
  }

  Future<void> setState({
    List<TextsModel>? texts,
    List<Map<String, dynamic>>? errorList,
    List<String>? downloadedLangPack,
    List<String>? favoriteList,
    String? uid,
  }) async {
    final Map<String, dynamic> fields = {
      if (texts != null)
        LocalDbEnum.texts.name: texts.map((item) => jsonEncode(item)).toList(),
      if (errorList != null)
        LocalDbEnum.errorList.name: errorList
            .map((item) => jsonEncode(item))
            .toList(),
      if (downloadedLangPack != null)
        LocalDbEnum.downloadedLangPack.name: downloadedLangPack,
      if (favoriteList != null) LocalDbEnum.favoriteList.name: favoriteList,
      if (uid != null) LocalDbEnum.uid.name: uid,
    };

    await _setLocalDb(fields: fields);

    final current = state.value ?? const LocalDbModel();
    state = AsyncData(
      current.copyWith(
        texts: texts ?? current.texts,
        downloadedLangPack: downloadedLangPack ?? current.downloadedLangPack,
        favoriteList: favoriteList ?? current.favoriteList,
        uid: uid ?? current.uid,
        errorList: errorList ?? current.errorList,
      ),
    );
  }

  Future<void> _setLocalDb({required Map<String, dynamic> fields}) async {
    final repo = await _repoFuture;
    final List<Future<void>> futures = [];

    for (final entry in fields.entries) {
      final key = entry.key;
      final value = entry.value;

      if (value is String) {
        futures.add(repo.setString(key: key, value: value));
      } else if (value is bool) {
        futures.add(repo.setBool(key: key, value: value));
      } else if (value is List<String>) {
        futures.add(repo.setStringList(key: key, value: value));
      } else if (value is int) {
        futures.add(repo.setInt(key: key, value: value));
      } else if (value is double) {
        futures.add(repo.setDouble(key: key, value: value));
      }
    }

    await Future.wait(futures);
  }

  Future<void> setFavorite({required String id}) async {
    final current = state.value ?? const LocalDbModel();
    final asis = List<String>.from(current.favoriteList);

    if (asis.contains(id)) {
      asis.remove(id);
    } else {
      asis.add(id);
    }

    await setState(favoriteList: asis);
  }

  Future<void> setErrorList({required Map<String, dynamic> data}) async {
    final current = state.value ?? const LocalDbModel();
    final asis = List<Map<String, dynamic>>.from(current.errorList);
    asis.add(data);
    await setState(errorList: asis);
  }
}

final localDbStateProvider =
    AsyncNotifierProvider<LocalDbStateProvider, LocalDbModel>(
      LocalDbStateProvider.new,
    );
