import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/resources.dart';
import '../../widgets/common/custom_app_bar.dart';
import './screens/recommend/recommend_screen.dart';
import './screens/story/story_screen.dart';

class BodcastScreen extends StatefulWidget {
  const BodcastScreen({super.key});

  @override
  State<BodcastScreen> createState() => _BodcastScreenState();
}

class _BodcastScreenState extends State<BodcastScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  final List<Widget> _children = [
    const RecommendScreen(),
    const StoryScreen(),
  ];

  @override
  void initState() {
    _controller = TabController(length: _children.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        middle: TabBar(
          controller: _controller,
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyles.bigNormalTitle,
          labelColor: Colours.textNormal,
          indicatorColor: Colours.brand,
          indicatorPadding: EdgeInsets.zero,
          unselectedLabelColor: Colours.text_2,
          padding: EdgeInsets.symmetric(horizontal: 70.w),
          tabs: const [
            Tab(text: '推荐'),
            Tab(text: '故事'),
          ],
        ),
        trailing: GestureDetector(
          onTap: () => print('plus'),
          child: const FaIcon(FontAwesomeIcons.plus),
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: _children,
      ),
    );
  }
}
