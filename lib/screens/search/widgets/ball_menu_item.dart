import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/resources.dart';

class BallMenuItem extends StatelessWidget {
  const BallMenuItem({
    super.key,
    required this.iconUrl,
    required this.name,
    this.press,
  });

  final String iconUrl;
  final String name;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp24 / 2),
        child: Column(
          children: [
            // icon
            Container(
              width: 70.w,
              height: 70.w,
              decoration: const ShapeDecoration(
                color: Color(0xfffef3f2),
                shape: CircleBorder(),
              ),
              child: Image.network(
                iconUrl,
                color: const Color(0xfffe5352),
              ),
            ),

            Gaps.vGap6,

            // label
            Text(
              name,
              style: TextStyles.textSize18.copyWith(
                color: Colours.text_2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
