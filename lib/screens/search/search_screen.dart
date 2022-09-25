import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/resources.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/search_box.dart';
import './widgets/banner_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  final List<Map<String, String>> banners = [
    {
      'pic':
          'http://p1.music.126.net/BcZXvoTKen7fPMDXezzScQ==/109951167853780577.jpg',
      'typeTitle': '新歌首发',
      'titleColor': 'red',
    },
    {
      'pic':
          'http://iadmusicmat.music.126.net/e75cf5bed1174fc3b70848a880146ac5.jpg',
      'typeTitle': '广告',
      'titleColor': 'blue',
    },
    {
      'pic':
          'http://p1.music.126.net/RSVgc3DHmFAWo8aKg3cTJA==/109951167853769104.jpg',
      'typeTitle': '新歌首发',
      'titleColor': 'red',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        middle: GestureDetector(
          onTap: () => print('SearchBox'),
          child: const SearchBox(
            title: '我好像在哪见过你',
            subTitle: '薛之谦',
          ),
        ),
        trailing: GestureDetector(
          onTap: () => print('microphoneLines'),
          child: const FaIcon(FontAwesomeIcons.microphoneLines),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: Dimens.vGapDp24),
        children: [
          // 轮播图
          Container(
            padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp24),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colours.mainBg, Colours.secondaryBg],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.radiusDp24 / 2),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CarouselSlider(
                    items: banners
                        .map((item) => BannerItem(
                              picUrl: item['pic']!,
                              tag: item['typeTitle']!,
                              color: Colors.indigo,
                              press: () => print(item['pic']!),
                            ))
                        .toList(),
                    carouselController: _controller,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 492 / 192,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),

                  // 指示器
                  Positioned(
                    bottom: 9.h,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: banners
                            .asMap()
                            .entries
                            .map((entry) => GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: Dimens.hGapDp6 / 2,
                                    ),
                                    width: 12.w,
                                    height: 3.w,
                                    decoration: ShapeDecoration(
                                      shape: const StadiumBorder(),
                                      color: Colours.secondaryBg.withOpacity(
                                        entry.key == _currentIndex ? .9 : .4,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
