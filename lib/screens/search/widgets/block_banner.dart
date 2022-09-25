import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './banner_item.dart';
import '../../../res/resources.dart';
import '../../../providers/home/banner_provider.dart';

class BlockBanner extends ConsumerStatefulWidget {
  const BlockBanner({super.key});

  @override
  ConsumerState<BlockBanner> createState() => _BlockBannerState();
}

class _BlockBannerState extends ConsumerState<BlockBanner> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final banners = ref.watch(bannerProvider);

    return Container(
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
                  .map((banner) => BannerItem(
                        picUrl: banner.pic,
                        tag: banner.typeTitle,
                        color: banner.tagColor,
                        press: () => print(banner.url),
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
                            onTap: () => _controller.animateToPage(entry.key),
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
    );
  }
}
