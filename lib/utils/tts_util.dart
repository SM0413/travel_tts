import 'package:flutter_tts/flutter_tts.dart';

abstract class TtsUtil {
  static final FlutterTts _tts = FlutterTts();
  static bool _inited = false;

  static Future<void> _init() async {
    if (_inited) return;
    await _tts.awaitSpeakCompletion(true); // speak는 끝날 때까지 대기
    _inited = true;
  }

  static Future<void> setSpeechRate(double speed) async {
    await _init();
    // rate는 0.1 ~ 2.0 사이의 값이어야 함
    final clamped = speed.clamp(0.5, 2.0);
    await _tts.setPitch(clamped);
  }

  static Future<void> play({
    required String value,
    required double speed,
  }) async {
    await setSpeechRate(speed);
    await _tts.speak(value);
  }

  static Future<void> stop() async {
    await _tts.stop();
  }
}
