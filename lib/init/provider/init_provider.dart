import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/users_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/db/users_enum.dart';
import 'package:travel_tts/utils/device_info_util.dart';
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
        // 1) 로컬 UID 확보(없으면 생성)
        final localState = ref.read(localDbStateProvider);
        String uid = localState.value?.uid ?? '';
        if (GlobalUtil.isEmpty(uid)) {
          uid = StringUtil.getUUID();
          await ref.read(localDbStateProvider.notifier).setState(uid: uid);
        }

        Map<String, dynamic>? userRes;
        final bool online = await NetworkUtil.isOnlineNow();

        if (online) {
          // 2) Firebase Auth: 이미 로그인돼 있으면 재로그인 불필요
          final auth = FirebaseAuth.instance;
          if (auth.currentUser == null) {
            try {
              // 네트워크 지연 대비 타임아웃
              await auth.signInAnonymously().timeout(
                const Duration(seconds: 10),
              );
            } catch (_) {
              // 로그인 실패 시에도 오프라인 플로우로 계속 진행
            }
          }

          // 로그인에 성공했다면 서버 UID로 교체
          final current = auth.currentUser;
          if (current != null && !GlobalUtil.isEmpty(current.uid)) {
            uid = current.uid;
            await ref.read(localDbStateProvider.notifier).setState(uid: uid);
          }

          // 3) Firestore 사용자 문서 조회/생성
          try {
            final db = FirebaseFirestore.instance;
            final docRef = db.collection(DbEnum.users.name).doc(uid);
            final snap = await docRef.get();

            if (snap.exists) {
              userRes = GlobalUtil.getSingleDoc(snap);
            } else {
              // 최초 생성: 서버 타임스탬프와 함께 기록
              userRes = ToJsonUtil.users(name: uid);
              userRes[UsersEnum.createdAt.name] = FieldValue.serverTimestamp();
              userRes[UsersEnum.updatedAt.name] = FieldValue.serverTimestamp();
              await docRef.set(userRes, SetOptions(merge: true));

              // set 이후에는 로컬에서 즉시 사용할 수 있게 값 보정
              userRes[UsersEnum.createdAt.name] = DateTime.now()
                  .toIso8601String();
              userRes[UsersEnum.updatedAt.name] = DateTime.now()
                  .toIso8601String();
            }
          } catch (_) {
            // Firestore 에러 시에도 로컬 플로우로 계속 진행
          }
        }

        // 4) 오프라인/실패 대비 기본 값 보강
        userRes ??= <String, dynamic>{};
        userRes[UsersEnum.id.name] = uid;

        // 5) 최종 사용자 상태 반영
        ref
            .read(userStateProvider.notifier)
            .setModel(UsersModel.fromJson(userRes));
        state = const AsyncData(null);
      },
      isShowToast: true,
      fnName: "init_provider > init",
      errorMessage: "초기화에 실패했어요",
      userId: ref.read(userStateProvider).id,
      failFn: (e) async {
        if (!await NetworkUtil.isOnlineNow()) {
          await ref
              .read(localDbStateProvider.notifier)
              .setErrorList(
                data: ToJsonUtil.errorLog(
                  userId: ref.read(userStateProvider).id,
                  e: e,
                  stackTrace: StackTrace.current,
                  deviceInfo: await DeviceInfoUtil.getDeviceInfo(),
                ),
              );
        } else {
          final errorList = ref.read(localDbStateProvider).value!.errorList;
          if (!GlobalUtil.isEmpty(errorList)) {
            final List<Future> uploadFUture = errorList.map((item) {
              return FirebaseFirestore.instance
                  .collection(DbEnum.errorLog.name)
                  .doc(StringUtil.getUUID())
                  .set(item);
            }).toList();
            await Future.wait(uploadFUture);
            await ref
                .read(localDbStateProvider.notifier)
                .setState(errorList: []);
          }
        }
      },
    );
  }
}

final initProvider = AutoDisposeAsyncNotifierProvider<InitProvider, void>(
  InitProvider.new,
);
