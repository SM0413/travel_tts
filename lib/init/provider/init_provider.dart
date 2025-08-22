import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/users_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/db/users_enum.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class InitProvider extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> init() async {
    await TryCatchUtil.handle(
      fn: () async {
        if (GlobalUtil.isEmpty(ref.read(localDbStateProvider).value!.uid)) {
          await ref
              .read(localDbStateProvider.notifier)
              .setState(uid: StringUtil.getUUID());
        }
        String uid = ref.read(localDbStateProvider).value!.uid;
        Map<String, dynamic>? userRes;
        if (await NetworkUtil.isOnlineNow()) {
          final auth = FirebaseAuth.instance;
          await auth.signInAnonymously();

          final db = FirebaseFirestore.instance;
          uid = auth.currentUser?.uid ?? uid;
          await ref.read(localDbStateProvider.notifier).setState(uid: uid);
          userRes = GlobalUtil.getSingleDoc(
            await db.collection(DbEnum.users.name).doc(uid).get(),
          );
          if (GlobalUtil.isEmpty(userRes)) {
            userRes = ToJsonUtil.users(name: uid);
            await db.collection(DbEnum.users.name).doc(uid).set(userRes);
          }
        }
        userRes ??= {};
        userRes[UsersEnum.id.name] = uid;
        ref.read(localDbStateProvider);
        ref
            .read(userStateProvider.notifier)
            .setModel(UsersModel.fromJson(userRes));
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
