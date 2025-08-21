import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_tts/enums/db/error_log_enum.dart';

abstract class ToJsonUtil {
  static final _auth = FirebaseAuth.instance;
  static Map<String, dynamic> errorLog({
    required dynamic e,
    required StackTrace stackTrace,
    required Map<String, dynamic> deviceInfo,
  }) {
    return {
      ErrorLogEnum.userId.name: _auth.currentUser?.uid,
      ErrorLogEnum.error.name: e.toString(),
      ErrorLogEnum.stackTrace.name: stackTrace.toString(),
      ErrorLogEnum.deviceInfo.name: deviceInfo,
      ErrorLogEnum.createdAt.name: FieldValue.serverTimestamp(),
    };
  }
}
