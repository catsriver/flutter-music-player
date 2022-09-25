import 'package:flutter/material.dart';

import '../../res/resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.leading,
    required this.middle,
    required this.trailing,
  }) : super(key: key);

  final Widget leading;
  final Widget middle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp24),
              child: leading,
            ),
            Expanded(
              child: middle,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp24),
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
