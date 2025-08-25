import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:travel_tts/utils/env_util.dart';
import 'package:travel_tts/utils/size_util.dart';

class AdMobBanner extends HookWidget {
  const AdMobBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final ad = useState<BannerAd?>(null);
    final loaded = useState(false);

    useEffect(() {
      String unitId = "";
      if (Platform.isIOS) {
        if (kReleaseMode) {
          unitId = EnvUtil.iosBannerAdPrdId();
        } else {
          unitId = EnvUtil.iosBannerAdTestId();
        }
      } else {
        if (kReleaseMode) {
          unitId = EnvUtil.andBannerAdPrdId();
        } else {
          unitId = EnvUtil.andBannerAdTestId();
        }
      }
      final banner = BannerAd(
        size: AdSize.banner,
        adUnitId: unitId,
        listener: BannerAdListener(
          onAdLoaded: (adObj) {
            loaded.value = true;
          },
          onAdFailedToLoad: (adObj, error) {
            adObj.dispose();
            loaded.value = false;
          },
        ),
        request: const AdRequest(),
      );

      banner.load();
      ad.value = banner;

      // cleanup
      return () {
        ad.value?.dispose();
      };
    }, []); // 최초 빌드 시 1회 실행

    if (!loaded.value || ad.value == null) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: SizeUtil.getW(100),
      height: ad.value!.size.height.toDouble(),
      child: AdWidget(ad: ad.value!),
    );
  }
}
