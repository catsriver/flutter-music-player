import 'package:flutter/material.dart';

import './screens/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Music Player',
      home: HomeScreen(),
    );
  }
}
