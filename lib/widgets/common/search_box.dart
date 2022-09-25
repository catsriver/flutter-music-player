import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../res/resources.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: const ShapeDecoration(
        color: Colours.secondaryBg,
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.magnifyingGlass,
            color: Colours.text_2,
            size: 22.h,
          ),
          Gaps.hGap6,
          Text(
            title,
            style: TextStyles.inputText.copyWith(
              color: Colours.text_2,
            ),
          ),
          Gaps.hGap6,
          Text(
            subTitle,
            style: TextStyles.inputText.copyWith(
              color: Colours.text_3,
            ),
          ),
        ],
      ),
    );
  }
}
