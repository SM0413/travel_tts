import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/toast_util.dart';

/// 한 언어쌍(source -> target)마다 1개 인스턴스를 재사용하는 번역 유틸
class TransUtil {
  static Future<bool> isDownloaded(TranslateLanguage model) async {
    final modelManager = OnDeviceTranslatorModelManager();
    return await modelManager.isModelDownloaded(model.bcpCode);
  }

  final TranslateLanguage sourceLanguage;
  final TranslateLanguage targetLanguage;

  late final OnDeviceTranslator _translator;
  bool _initialized = false;
  bool _disposed = false;
  Future<void>? _initFuture; // 동시 초기화 방지

  TransUtil(this.sourceLanguage, this.targetLanguage);

  /// 최초 1회만 모델 다운로드 + Translator 생성
  Future<void> _ensureInitialized(dynamic ref) async {
    if (_disposed) throw StateError('TransUtil already disposed');
    if (_initialized) return;

    // 동시 호출 시 하나만 진행
    _initFuture ??= () async {
      final modelManager = OnDeviceTranslatorModelManager();

      // 대상/원본 모델이 없으면 다운로드 (최초 1회)
      if (!await isDownloaded(targetLanguage)) {
        if (!await NetworkUtil.isOnlineNow()) {
          ToastUtil.show(
            title: "인터넷이 연결되지 않았어요",
            subTitle: "번역을 위해 최초 1회 다운로드가 필요해요\n인터넷을 연결해주세요",
          );
          return;
        }
        final asis = List<String>.from(
          ref.read(localDbStateProvider).value!.downloadedLangPack,
        );
        await ref
            .read(localDbStateProvider.notifier)
            .setState(
              downloadedLangPack: {
                ...asis,
                TransEnum.values
                    .firstWhere((value) => value.type == targetLanguage)
                    .ko,
              }.toList(),
            );
        await modelManager.downloadModel(targetLanguage.bcpCode);
      }
      if (!await isDownloaded(sourceLanguage)) {
        if (!await NetworkUtil.isOnlineNow()) {
          ToastUtil.show(
            title: "인터넷이 연결되지 않았어요",
            subTitle: "번역을 위해 최초 1회 다운로드가 필요해요\n인터넷을 연결해주세요",
          );
          return;
        }
        final asis = List<String>.from(
          ref.read(localDbStateProvider).value!.downloadedLangPack,
        );
        await ref
            .read(localDbStateProvider.notifier)
            .setState(
              downloadedLangPack: {
                ...asis,
                TransEnum.values
                    .firstWhere((value) => value.type == sourceLanguage)
                    .ko,
              }.toList(),
            );
        await modelManager.downloadModel(sourceLanguage.bcpCode);
      }

      _translator = OnDeviceTranslator(
        sourceLanguage: sourceLanguage,
        targetLanguage: targetLanguage,
      );
      _initialized = true;
    }();

    await _initFuture;
  }

  /// 텍스트 번역 (빈값은 즉시 반환)
  Future<String> translate(String? text, dynamic ref) async {
    final input = (text ?? '').trim();
    if (input.isEmpty) return '';

    await _ensureInitialized(ref);
    if (_disposed) throw StateError('TransUtil already disposed');

    // OnDeviceTranslator는 재사용 가능
    return await _translator.translateText(input);
  }

  /// 자원 정리 (화면/앱 종료 시 호출)
  Future<void> dispose() async {
    if (_disposed) return;
    if (_initialized) {
      await _translator.close();
    }
    _disposed = true;
  }
}
