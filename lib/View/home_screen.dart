import 'package:aso_app/Helper/ad_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AdHelper.adHelper.loadBannerAds();
    AdHelper.adHelper.loadInterstitialAds();
    AdHelper.adHelper.loadAppOpenAds();
    AdHelper.adHelper.loadRewardedAds();
  }

  int coin = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ads App"),
        centerTitle: true,
        actions: [
          Text("$coin"),
        ],
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text("Interstitial Ads"),
                  onPressed: () async {
                    await AdHelper.adHelper.interstitialAd!.show();
                    AdHelper.adHelper.loadInterstitialAds();
                  },
                ),
                ElevatedButton(
                  child: const Text("App Open Ads"),
                  onPressed: () async {
                    await AdHelper.adHelper.appOpenAd!.show();
                    AdHelper.adHelper.loadAppOpenAds();
                  },
                ),
                ElevatedButton(
                  child: const Text("Rewarded Ads"),
                  onPressed: () async {
                    await AdHelper.adHelper.rewardedAd!.show(onUserEarnedReward: (view, item) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${item.amount} ${item.type}"),));
                      coin += item.amount.toInt();
                    });
                    AdHelper.adHelper.loadRewardedAds();
                  },
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 60, child: AdWidget(ad: AdHelper.adHelper.bannerAd!)),

            ],
          ),
        ],
      ),
    );
  }
}
