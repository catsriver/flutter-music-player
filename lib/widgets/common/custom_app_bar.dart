import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/resources.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leading,
    required this.middle,
    required this.trailing,
  }) : super(key: key);

  final Widget? leading;
  final Widget middle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: SizedBox(
        height: kToolbarHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp24),
              child: leading ??
                  GestureDetector(
                    onTap: () => print('bars'),
                    child: const FaIcon(FontAwesomeIcons.bars),
                  ),
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
