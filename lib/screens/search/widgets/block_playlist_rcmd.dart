import 'package:flutter/material.dart';

import '../../../widgets/common/block_container.dart';

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
      child: Container(
        height: 300,
        color: Colors.indigo,
      ),
    );
  }
}
