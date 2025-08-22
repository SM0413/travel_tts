import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/utils/global_util.dart';

class MainPageRepo {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  Future<List<Map<String, dynamic>>> getData() async {
    final res = await _db
        .collection(DbEnum.texts.name)
        .where(TextsEnum.userId.name, isEqualTo: _auth.currentUser?.uid)
        .get();

    return GlobalUtil.getDocs(res);
  }

  Future<Map<String, dynamic>?> upload({
    required Map<String, dynamic> data,
  }) async {
    await _db
        .collection(DbEnum.texts.name)
        .doc(data[TextsEnum.id.name])
        .set(data);
    return data;
  }
}

final mainPageRepo = Provider<MainPageRepo>((ref) {
  return MainPageRepo();
});
