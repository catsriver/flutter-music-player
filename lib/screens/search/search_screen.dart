import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/resources.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/search_box.dart';
import 'widgets/block_banner.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        middle: GestureDetector(
          onTap: () => print('SearchBox'),
          child: const SearchBox(
            title: '我好像在哪见过你',
            subTitle: '薛之谦',
          ),
        ),
        trailing: GestureDetector(
          onTap: () => print('microphoneLines'),
          child: const FaIcon(FontAwesomeIcons.microphoneLines),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: Dimens.vGapDp24),
        children: const [
          // 轮播图
          BlockBanner(),
        ],
      ),
    );
  }
}
