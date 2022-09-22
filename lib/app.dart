import 'package:flutter/material.dart';
import 'package:flutter_music_player/providers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './router/router.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);

    return ScreenUtilInit(
      designSize: const Size(540, 1200), // 一加8T
      builder: (_, __) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Music Player',
          theme: themeNotifier.getTheme(),
          routeInformationParser: router.routeInformationParser,
          routeInformationProvider: router.routeInformationProvider,
          routerDelegate: router.routerDelegate,
        );
      },
    );
  }
}
