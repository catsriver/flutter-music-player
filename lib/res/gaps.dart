import 'package:flutter/material.dart';

import './dimens.dart';

class Gaps {
  // 垂直间隔
  static final Widget vGap12 = SizedBox(height: Dimens.vGapDp24 / 2);
  static final Widget vGap24 = SizedBox(height: Dimens.vGapDp24);
  static final Widget vGap60 = SizedBox(height: Dimens.vGapDp60);

  // 水平间隔
  static final Widget hGap6 = SizedBox(width: Dimens.hGapDp6);
  static final Widget hGap14 = SizedBox(width: Dimens.hGapDp14);
}
