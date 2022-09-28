import 'package:flutter/material.dart';

import '../../res/resources.dart';

class HorizontalScrollView extends StatelessWidget {
  const HorizontalScrollView({
    super.key,
    required this.children,
    this.padding,
  });

  final List<Widget> children;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding ?? Dimens.hGapDp24),
        child: Row(
          children: children,
        ),
      ),
    );
  }
}
