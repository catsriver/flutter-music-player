import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../providers/home/ball_menu_provider.dart';
import '../../providers/home/banner_provider.dart';
import '../../res/resources.dart';
import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/search_box.dart';
import './widgets/block_banner.dart';
import './widgets/block_ball_menu.dart';
import './widgets/block_playlist_rcmd.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  void initState() {
    _requetApi();
    ref.read(ballMenuProvider.notifier).fetchAndSetMenus();
    super.initState();
  }

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
        children: [
          // 轮播图
          const BlockBanner(),

          // 圆形图标入口列表
          const BlockBallMenu(),

          // 分割线
          Gaps.line,

          // 推荐歌单
          const BlockPlaylistRcmd()
        ],
      ),
    );
  }

  Future<void> _requetApi() async {
    const url = 'http://47.108.129.252:3000/homepage/block/page';

    try {
      final response = await Dio().get(url);
      final blocks = (response.data as Map<String, dynamic>)['data']['blocks'];

      // 初始化banners数据
      ref
          .read(bannerProvider.notifier)
          .initState(blocks[0]['extInfo']['banners']);
    } catch (err) {
      rethrow;
    }
  }
}
