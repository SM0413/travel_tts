import 'package:shared_preferences/shared_preferences.dart';

class LocalDbRepo {
  final SharedPreferences _pref;

  LocalDbRepo(this._pref);

  Future<void> setString({
    required final String key,
    required final String value,
  }) async {
    await _pref.setString(key, value);
  }

  Future<void> setStringList({
    required final String key,
    required final List<String> value,
  }) async {
    await _pref.setStringList(key, value);
  }

  Future<void> setInt({
    required final String key,
    required final int value,
  }) async {
    await _pref.setInt(key, value);
  }

  Future<void> setBool({
    required final String key,
    required final bool value,
  }) async {
    await _pref.setBool(key, value);
  }

  Future<void> setDouble({
    required final String key,
    required final double value,
  }) async {
    await _pref.setDouble(key, value);
  }

  String? getString({required final String key}) {
    return _pref.getString(key);
  }

  List<String>? getStringList({required final String key}) {
    return _pref.getStringList(key);
  }

  int? getInt({required final String key}) {
    return _pref.getInt(key);
  }

  bool? getBool({required final String key}) {
    return _pref.getBool(key);
  }

  double? getDouble({required final String key}) {
    return _pref.getDouble(key);
  }
}
