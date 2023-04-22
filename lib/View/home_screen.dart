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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ads App"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              child: Text("Interstitial Ads"),
              onPressed: () async {
                await AdHelper.adHelper.interstitialAd!.show();
                AdHelper.adHelper.loadInterstitialAds();
              },
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
