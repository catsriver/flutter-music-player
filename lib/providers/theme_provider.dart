import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../res/resources.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeNotifier() : super(ThemeData());

  ThemeData getTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colours.primary,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colours.secondaryBg,
        foregroundColor: Colours.textNormal,
      ),
      scaffoldBackgroundColor: Colours.secondaryBg,
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Colours.text_3,
          fontSize: Dimens.fontSp24,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.h, color: Colours.divider),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.h, color: Colours.divider),
        ),
      ),
    );
  }
}

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) => ThemeNotifier());
