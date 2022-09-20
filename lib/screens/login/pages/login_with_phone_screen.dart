import 'package:flutter/material.dart';
import 'package:flutter_music_player/widgets/common/stadium_button.dart';

import '../../../res/resources.dart';

class LoginWithPhoneScreen extends StatelessWidget {
  const LoginWithPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('手机号登陆'),
      ),
      body: Padding(
        padding: EdgeInsets.all(Dimens.hGapDp24),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  '登陆体验更多精彩',
                  style: TextStyles.bigNormalTitle,
                ),
                Gaps.vGap12,
                Text(
                  '未登陆手机号登陆后将自动创建账号',
                  style: TextStyles.hintText,
                ),
              ],
            ),

            Gaps.vGap24,

            // 手机号输入框
            TextField(
              decoration: InputDecoration(
                prefix: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '+86',
                      style: TextStyles.inputText,
                    ),
                    const Icon(Icons.arrow_drop_down_outlined),
                  ],
                ),
                hintText: '请输入手机号',
              ),
            ),

            Gaps.vGap60,

            // 按钮
            StadiumButton(
              text: '下一步',
              press: () {
                print('下一步');
              },
            ),

            Gaps.vGap24,

            // 找回账号
            TextButton(
              child: Text(
                '找回账号',
                style: TextStyles.tipText,
              ),
              onPressed: () {
                print('找回账号');
              },
            ),
          ],
        ),
      ),
    );
  }
}
