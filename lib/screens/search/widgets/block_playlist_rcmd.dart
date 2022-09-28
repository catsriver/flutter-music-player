import 'package:flutter/material.dart';

import '../../../res/resources.dart';
import '../../../widgets/common/block_container.dart';
import '../../../widgets/common/horizontal_scroll_view.dart';
import '../../../widgets/common/slide_playlist.dart';

class BlockPlaylistRcmd extends StatelessWidget {
  const BlockPlaylistRcmd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlockContainer(
      title: '推荐歌单',
      actionType: BlockContainerActionType.more,
      onRefresh: () {
        print('refresh');
      },
      onActionPress: () {
        print('action typed');
      },
      child: HorizontalScrollView(
        padding: Dimens.hGapDp24 - Dimens.hGapDp16 / 2,
        children: List.generate(
          10,
          (index) => SlidePlaylist(
            playCount: 2516835,
            title: '拔刀能留住落樱吗',
            creativeType: 'scroll_playlist',
            imgUrl:
                'http://p1.music.126.net/Ty7aG2OHsLmVreAk_0ELew==/109951164060111342.jpg',
            onPress: () => print(index),
          ),
        ),
      ),
    );
  }
}
