import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class InitProvider extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> init() async {
    await TryCatchUtil.handle(
      fn: () async {
        final auth = FirebaseAuth.instance;
        await auth.signInAnonymously();
        final db = FirebaseFirestore.instance;
        final uid = auth.currentUser?.uid;
        final userRes = GlobalUtil.getSingleDoc(
          await db.collection(DbEnum.users.name).doc(uid).get(),
        );
        if (GlobalUtil.isEmpty(userRes)) {
          await db
              .collection(DbEnum.users.name)
              .doc(uid)
              .set(ToJsonUtil.users(name: uid ?? StringUtil.getUUID()));
        }
      },
      isShowToast: true,
      fnName: "init_provider > init",
      errorMessage: "초기화에 실패했어요",
    );
  }
}

final initProvider = AutoDisposeAsyncNotifierProvider<InitProvider, void>(
  InitProvider.new,
);
