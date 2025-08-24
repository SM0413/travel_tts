import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/string_util.dart';

class MainPageRepo {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Future<List<Map<String, dynamic>>> getMyData() async {
    final res = await _db
        .collection(DbEnum.texts.name)
        .where(TextsEnum.userId.name, isEqualTo: _auth.currentUser?.uid)
        .get();

    return GlobalUtil.getDocs(res);
  }

  Future<List<Map<String, dynamic>>> getOtherUserData() async {
    final res = await _db
        .collection(DbEnum.texts.name)
        .where(TextsEnum.isShare.name, isEqualTo: true)
        .where(TextsEnum.userId.name, isNotEqualTo: _auth.currentUser?.uid)
        .get();

    return GlobalUtil.getDocs(res);
  }

  Future<Map<String, dynamic>?> uploadTexts({
    required Map<String, dynamic> data,
  }) async {
    await _db
        .collection(DbEnum.texts.name)
        .doc(data[TextsEnum.id.name])
        .set(data);
    return data;
  }

  Future<void> deleteTexts({required TextsModel model}) async {
    _db
        .collection(DbEnum.backup.name)
        .doc("${DateTime.now()}-${StringUtil.getUUID()}")
        .set(model.toJson());
    return await _db.collection(DbEnum.texts.name).doc(model.id).delete();
  }
}

final mainPageRepo = Provider<MainPageRepo>((ref) {
  return MainPageRepo();
});
