import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './dimens.dart';
import './colors.dart';

class Gaps {
  // 垂直间隔
  static final Widget vGap6 = SizedBox(height: Dimens.vGapDp6);
  static final Widget vGap12 = SizedBox(height: Dimens.vGapDp24 / 2);
  static final Widget vGap24 = SizedBox(height: Dimens.vGapDp24);
  static final Widget vGap60 = SizedBox(height: Dimens.vGapDp60);

  // 水平间隔
  static final Widget hGap6 = SizedBox(width: Dimens.hGapDp6);
  static final Widget hGap14 = SizedBox(width: Dimens.hGapDp14);
  static final Widget hGap66 = SizedBox(width: Dimens.hGapDp66);

  // 分割线
  static final Widget line = Divider(
    height: 1.h,
    color: Colours.divider,
  );
}
