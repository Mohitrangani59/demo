import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(MaterialApp(home: Home(),));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  BannerAd? _bannerAd;
  bool _isLoaded = false;

  // TODO: replace this test ad unit with your own ad unit.
  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';


  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(

        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },

        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {},

        onAdClosed: (Ad ad) {},

        onAdImpression: (Ad ad) {},
      ),
    )..load();
  }


  // InterstitialAd? _interstitialAd;
  //
  // // TODO: replace this test ad unit with your own ad unit.
  // final interadUnitId = Platform.isAndroid
  //     ? 'ca-app-pub-3940256099942544/1033173712'
  //     : 'ca-app-pub-3940256099942544/4411468910';
  //
  // /// Loads an interstitial ad.
  // void interloadAd() {
  //   InterstitialAd.load(
  //       adUnitId: interadUnitId,
  //       request: const AdRequest(),
  //       adLoadCallback: InterstitialAdLoadCallback(
  //         // Called when an ad is successfully received.
  //         onAdLoaded: (ad) {
  //           debugPrint('$ad loaded.');
  //           // Keep a reference to the ad so you can show it later.
  //           _interstitialAd = ad;
  //         },
  //         // Called when an ad request failed.
  //         onAdFailedToLoad: (LoadAdError error) {
  //           debugPrint('InterstitialAd failed to load: $error');
  //         },
  //       ));
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAd();
    // interloadAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(onPressed: () {

          }, child: Text("Banner")),
          ElevatedButton(onPressed: () {

          }, child: Text("Video"))
        ],
      ),
    );
  }
}
