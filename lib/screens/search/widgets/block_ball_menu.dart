import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/home/ball_menu_provider.dart';
import '../../../res/resources.dart';
import './ball_menu_item.dart';

class BlockBallMenu extends ConsumerWidget {
  const BlockBallMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final menus = ref.watch(ballMenuProvider);

    return Container(
      color: Colours.secondaryBg,
      padding: EdgeInsets.symmetric(vertical: Dimens.vGapDp28),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp24 / 2),
          child: Row(
            children: menus
                .map((menu) => BallMenuItem(
                      iconUrl: menu.iconUrl,
                      name: menu.name,
                      press: () => print(menu.url),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
