import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  AdHelper._();

  static final AdHelper adHelper = AdHelper._();

  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;
  AppOpenAd? appOpenAd;
  RewardedAd? rewardedAd;

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
        onAdFailedToLoad: (error) => print("InterstitialAd Erro :: $error"),
      ),
    );
  }

  loadAppOpenAds() {
    AppOpenAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/3419835294',
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          print("AppOpenAd Error :: ${error}");
        },
      ),
      orientation: AppOpenAd.orientationPortrait,
    );
  }

  loadRewardedAds() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-1162552756272608/8410849545',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          },
          onAdFailedToLoad: (error) {
            print("RewardedAd Error :: ${error}");
          },
        ));
  }
}
