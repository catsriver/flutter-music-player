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
        hintStyle: TextStyles.hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.h, color: Colours.divider),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(width: 2.h, color: Colours.divider),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colours.secondaryBg,
        selectedItemColor: Colours.textBrand,
        unselectedItemColor: Colours.text_3,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyles.textSize14,
        unselectedLabelStyle: TextStyles.textSize14,
      ),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    );
  }
}

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) => ThemeNotifier());
