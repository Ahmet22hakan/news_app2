import 'dart:io';

class AdConfig {
  //-- Admob Ads --
  static const String admobAppIdAndroid = 'ca-app-pub-3940256099942544~3347511713';
  static const String admobAppIdiOS = 'ca-app-pub-3940256099942544~1458002511';

  static const String admobInterstitialAdUnitIdAndroid = 'ca-app-pub-3940256099942544/1033173712';
  static const String admobInterstitialAdUnitIdiOS = 'ca-app-pub-3940256099942544/4411468910';

  static const String admobBannerAdUnitIdAndroid = 'ca-app-pub-3940256099942544/6300978111';
  static const String admobBannerAdUnitIdiOS = 'ca-app-pub-3940256099942544/2934735716';

  //-- Fb Ads --
  static const String fbInterstitialAdUnitIdAndroid = '544514846502**************';
  static const String fbInterstitialAdUnitIdiOS = '5445148465020**************';

  static const String fbBannerAdUnitIdAndroid = '5445148465020**************';
  static const String fbBannerAdUnitIdiOS = '54451484650202**************';

  static const Map<String, int> kategori = {
    "Anket": 2489,
    "Astroloji": 2653,
    "Eğitim": 28,
    "Finans": 21,
    "Güncel": 24,
    "İş Dünyası": 19,
    "Kültür Sanat": 20,
    "Magazin": 22,
    "Medya": 23,
    "Öne Çıkanlar": 43
  };

  // -- Don't edit these --

  String getAdmobAppId() {
    if (Platform.isAndroid) {
      return admobAppIdAndroid;
    } else {
      return admobAppIdiOS;
    }
  }

  String getAdmobBannerAdUnitId() {
    if (Platform.isAndroid) {
      return admobBannerAdUnitIdAndroid;
    } else {
      return admobBannerAdUnitIdiOS;
    }
  }

  String getAdmobInterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return admobInterstitialAdUnitIdAndroid;
    } else {
      return admobInterstitialAdUnitIdiOS;
    }
  }

  String getFbBannerAdUnitId() {
    if (Platform.isAndroid) {
      return fbBannerAdUnitIdAndroid;
    } else {
      return fbBannerAdUnitIdiOS;
    }
  }

  String getFbInterstitialAdUnitId() {
    if (Platform.isAndroid) {
      return fbInterstitialAdUnitIdAndroid;
    } else {
      return fbInterstitialAdUnitIdiOS;
    }
  }
}
