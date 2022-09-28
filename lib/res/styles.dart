import 'package:flutter/material.dart';

import './dimens.dart';
import './colors.dart';

class TextStyles {
  static TextStyle bigTitle = TextStyle(
    fontSize: Dimens.fontSp26,
    color: Colours.textNormal,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bigNormalTitle = TextStyle(
    fontSize: Dimens.fontSp26,
    color: Colours.textNormal,
  );

  static TextStyle middleTitle = TextStyle(
    fontSize: Dimens.fontSp18,
    color: Colours.textNormal,
  );

  static TextStyle hintText = TextStyle(
    fontSize: Dimens.fontSp20,
    color: Colours.text_3,
  );

  static TextStyle actionText = TextStyle(
    fontSize: Dimens.fontSp20,
    color: Colours.textNormal,
  );

  static TextStyle tipText = TextStyle(
    fontSize: Dimens.fontSp20,
    color: Colours.textTips,
  );

  static TextStyle inputText = TextStyle(
    fontSize: Dimens.fontSp22,
    color: Colours.textNormal,
  );

  static TextStyle textSize14 = TextStyle(
    fontSize: Dimens.fontSp14,
  );

  static TextStyle textSize16 = TextStyle(
    fontSize: Dimens.fontSp16,
  );

  static TextStyle textSize18 = TextStyle(
    fontSize: Dimens.fontSp18,
  );
}
