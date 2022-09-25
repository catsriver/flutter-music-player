import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../widgets/common/custom_app_bar.dart';
import '../../widgets/common/search_box.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: GestureDetector(
          onTap: () => print('bars'),
          child: const FaIcon(FontAwesomeIcons.bars),
        ),
        middle: GestureDetector(
          onTap: () => print('SearchBox'),
          child: const SearchBox(
            title: '我好像在哪见过你',
            subTitle: '薛之谦',
          ),
        ),
        trailing: GestureDetector(
          onTap: () => print('microphoneLines'),
          child: const FaIcon(FontAwesomeIcons.microphoneLines),
        ),
      ),
    );
  }
}
