import 'package:flutter/material.dart';

import '../../res/resources.dart';

class StadiumButton extends StatelessWidget {
  const StadiumButton({
    Key? key,
    required this.text,
    required this.press,
    this.outline = false,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  final bool outline;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: outline ? Colours.secondaryBg : Colours.brand,
      shape: const StadiumBorder(
        side: BorderSide(color: Colours.brand),
      ),
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
              color: outline ? Colours.brand : Colours.textWhite,
            ),
          ),
        ),
      ),
    );
  }
}
