import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/resources.dart';
import '../../util/formatCount.dart';

class SlidePlaylist extends StatelessWidget {
  const SlidePlaylist({
    super.key,
    required this.title,
    required this.imgUrl,
    required this.playCount,
    this.onPress,
    required this.creativeType,
  });

  final String title;
  final String imgUrl;
  final int playCount;
  final VoidCallback? onPress;
  final String creativeType;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 150.w,
        margin: EdgeInsets.symmetric(horizontal: Dimens.hGapDp16 / 2),
        child: Column(
          children: [
            // image
            Stack(
              children: [
                Container(
                  height: 150.w,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radiusDp24 / 2),
                  ),
                  child: Image.network(
                    imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),

                // 随机按钮
                if (creativeType == 'scroll_playlist')
                  Positioned(
                    right: Dimens.hGapDp10,
                    top: Dimens.vGapDp6,
                    child: FaIcon(
                      FontAwesomeIcons.shuffle,
                      color: Colours.textWhite,
                      size: Dimens.fontSp24,
                    ),
                  ),

                // 播放量
                if (creativeType == 'list')
                  Positioned(
                    right: Dimens.hGapDp6,
                    top: Dimens.vGapDp6,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.hGapDp6,
                        vertical: Dimens.vGapDp6 / 2,
                      ),
                      decoration: ShapeDecoration(
                        shape: const StadiumBorder(),
                        color: Colours.mainBg.withOpacity(.1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.play_arrow_outlined,
                            color: Colours.textWhite,
                            size: Dimens.fontSp24,
                          ),
                          Text(
                            formatCount(playCount),
                            style: TextStyles.textSize16.copyWith(
                              color: Colours.textWhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),

            Gaps.vGap6,

            // desc
            Text(
              title,
              style: TextStyles.middleTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
