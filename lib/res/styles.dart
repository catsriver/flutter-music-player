import 'package:flutter/material.dart';

import './dimens.dart';
import './colors.dart';

class TextStyles {
  static TextStyle bigTitle = TextStyle(
    fontSize: Dimens.fontSp26,
    color: Colours.textNormal,
    fontWeight: FontWeight.bold,
  );

  static TextStyle hintText = TextStyle(
    fontSize: Dimens.fontSp20,
    color: Colours.text_2,
  );

  static TextStyle tipText = const TextStyle(
    color: Colours.textTips,
  );
}
