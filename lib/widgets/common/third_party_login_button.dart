import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/resources.dart';

class ThirdPartyLoginButton extends StatelessWidget {
  const ThirdPartyLoginButton({
    Key? key,
    required this.iconUrl,
    required this.press,
  }) : super(key: key);

  final String iconUrl;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.hGapDp16),
      child: InkWell(
        onTap: press,
        customBorder: const CircleBorder(),
        child: Image.asset(
          iconUrl,
          width: 50.w,
        ),
      ),
    );
  }
}
