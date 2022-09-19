import 'package:flutter/material.dart';

import '../../res/resources.dart';

class StadiumButton extends StatelessWidget {
  const StadiumButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFDC2E1E),
      shape: const StadiumBorder(),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: press,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: Dimens.vGapDp16),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: Dimens.fontSp24,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
