import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/banner_model.dart';

class BannerNotifier extends StateNotifier<List<BannerModel>> {
  BannerNotifier()
      : super([
          // BannerModel(
          //   bannerId: "1664028164254202",
          //   pic:
          //       "http://p1.music.126.net/5HV50DAn9WHllI97GYbcWg==/109951167905144261.jpg",
          //   typeTitle: "专题",
          //   url: "https://y.music.163.com/m/at/632ab73ad587dc2da3079691",
          //   titleColor: "blue",
          // ),
          // BannerModel(
          //   bannerId: null,
          //   pic:
          //       "http://iadmusicmat.music.126.net/b1557b56986b4050b27acfa5bbc9a9b9.jpg",
          //   typeTitle: "广告",
          //   url: "906936224",
          //   titleColor: "blue",
          // ),
          // BannerModel(
          //   bannerId: "1664122239035148",
          //   pic:
          //       "http://p1.music.126.net/hjFmlyB5kCTc_RPJJ4C2iQ==/109951167908697083.jpg",
          //   typeTitle: "专题",
          //   url: "https://y.music.163.com/m/at/632e812ca76b4a6af682b5bc",
          //   titleColor: "blue",
          // ),
        ]);

  void initState(List<dynamic> banners) {
    final List<BannerModel> loadedBanners = [];

    for (var banner in banners) {
      loadedBanners.add(BannerModel.fromJson(banner));
    }

    state = loadedBanners;
  }
}

final bannerProvider = StateNotifierProvider<BannerNotifier, List<BannerModel>>(
    (ref) => BannerNotifier());
