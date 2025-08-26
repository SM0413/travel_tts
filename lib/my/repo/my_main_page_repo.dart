import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/utils/global_util.dart';

class MyMainPageRepo {
  final _db = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getMyTexts({
    required String userId,
  }) async {
    final res = await _db
        .collection(DbEnum.texts.name)
        .where(TextsEnum.userId.name, isEqualTo: userId)
        .get();

    return GlobalUtil.getDocs(res);
  }
}

final myMainPageRepo = Provider<MyMainPageRepo>((ref) {
  return MyMainPageRepo();
});
