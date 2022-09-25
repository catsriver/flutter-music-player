import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../account/account_screen.dart';
import '../bodcast/bodcast_screen.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;
  final List<Widget> children = [
    const SearchScreen(),
    const BodcastScreen(),
    const AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged: _animateToPage,
        children: children,
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  BottomNavigationBar _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _jumpToPage,
      items: const [
        BottomNavigationBarItem(
          label: '发现',
          icon: FaIcon(FontAwesomeIcons.compactDisc),
          tooltip: '',
        ),
        BottomNavigationBarItem(
          label: '播客',
          icon: FaIcon(FontAwesomeIcons.radio),
          tooltip: '',
        ),
        BottomNavigationBarItem(
          label: '我的',
          icon: FaIcon(FontAwesomeIcons.music),
          tooltip: '',
        ),
      ],
    );
  }

  void _animateToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _jumpToPage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.jumpToPage(index);
  }
}
