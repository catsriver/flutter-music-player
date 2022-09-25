import 'package:flutter/material.dart';

import '../../../res/resources.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({
    super.key,
    required this.picUrl,
    required this.tag,
    required this.color,
    this.press,
  });

  final String picUrl;
  final String tag;
  final Color color;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Image.network(
            picUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimens.hGapDp10,
                vertical: Dimens.vGapDp6,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    Dimens.radiusDp24 / 2,
                  ),
                ),
              ),
              child: Text(
                tag,
                style: TextStyles.textSize16.copyWith(
                  color: Colours.textWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
