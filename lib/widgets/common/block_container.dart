import 'package:flutter/material.dart';

import '../../res/resources.dart';

enum BlockContainerActionType {
  more,
  play,
}

class BlockContainer extends StatelessWidget {
  const BlockContainer({
    Key? key,
    required this.title,
    this.actionType = BlockContainerActionType.more,
    required this.child,
    this.onRefresh,
    this.onActionPress,
  }) : super(key: key);

  final String title;
  final BlockContainerActionType actionType;
  final Widget child;
  final VoidCallback? onRefresh;
  final VoidCallback? onActionPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colours.secondaryBg,
      padding: EdgeInsets.symmetric(vertical: Dimens.vGapDp24),
      child: Column(
        children: [
          // title
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.hGapDp24,
              vertical: Dimens.vGapDp6,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 刷新按钮
                if (onRefresh != null)
                  Padding(
                    padding: EdgeInsets.only(right: Dimens.hGapDp24),
                    child: GestureDetector(
                      onTap: onRefresh,
                      child: Icon(
                        Icons.refresh,
                        size: Dimens.fontSp24 * 1.5,
                      ),
                    ),
                  ),

                // 左侧title
                Expanded(
                  child: Text(
                    title,
                    style: TextStyles.bigTitle,
                  ),
                ),

                Gaps.hGap66,

                // 右侧按钮
                GestureDetector(
                  onTap: onActionPress,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.hGapDp14,
                      vertical: Dimens.vGapDp6,
                    ),
                    decoration: const ShapeDecoration(
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Colours.border,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // 更多
                        if (actionType == BlockContainerActionType.more)
                          Text(
                            '更多',
                            style: TextStyles.actionText,
                          ),
                        if (actionType == BlockContainerActionType.more)
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: Dimens.fontSp16,
                          ),

                        // 播放
                        if (actionType == BlockContainerActionType.play)
                          Icon(
                            Icons.play_arrow_rounded,
                            size: Dimens.fontSp26,
                          ),
                        if (actionType == BlockContainerActionType.play)
                          Text(
                            '播放',
                            style: TextStyles.actionText,
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // child
          child,
        ],
      ),
    );
  }
}
