import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  AdHelper._();

  static final AdHelper adHelper = AdHelper._();

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  loadBannerAds() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      listener: const BannerAdListener(),
      request: const AdRequest(),
    );

    bannerAd!.load();
  }
  
  loadInterstitialAds() {
    InterstitialAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/1033173712',
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) => interstitialAd = ad,
        onAdFailedToLoad: (error) => print("Erro :: $error"),
      ),
    );
  }
}
