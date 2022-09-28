import 'package:flutter/material.dart';

import '../../../widgets/common/block_container.dart';
import '../../../widgets/common/horizontal_scroll_view.dart';

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
        children: List.generate(
          10,
          (index) => Container(
            width: 100,
            height: 100,
            color: Colors.primaries[index],
          ),
        ),
      ),
    );
  }
}
