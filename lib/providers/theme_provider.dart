import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    );
  }
}

final themeProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) => ThemeNotifier());
