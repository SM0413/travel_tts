import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvUtil {
  static String andBannerAdTestId() => dotenv.get("AND_BANNER_AD_TEST_ID");
  static String iosBannerAdTestId() => dotenv.get("IOS_BANNER_AD_TEST_ID");
  static String andBannerAdPrdId() => dotenv.get("AND_BANNER_AD_PRD_ID");
  static String iosBannerAdPrdId() => dotenv.get("IOS_BANNER_AD_PRD_ID");
}
