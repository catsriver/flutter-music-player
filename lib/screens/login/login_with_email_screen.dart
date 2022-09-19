import 'package:flutter/material.dart';
import 'package:flutter_music_player/widgets/common/stadium_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/resources.dart';

class LoginWithEmailScreen extends StatelessWidget {
  const LoginWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('网易邮箱账号登陆'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          Dimens.hGapDp24,
          Dimens.vGapDp24,
          Dimens.hGapDp24,
          0,
        ),
        child: Column(
          children: [
            Gaps.vGap24,

            // 邮箱
            TextFormField(
              decoration: InputDecoration(
                hintText: '请输入邮箱账号',
                hintStyle: TextStyle(
                  color: const Color(0xFFCCCCCC),
                  fontSize: Dimens.fontSp24,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.h, color: const Color(0xFFD9D9D9)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.h, color: const Color(0xFFD9D9D9)),
                ),
              ),
              cursorColor: const Color(0xFFDC2E1E),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            Gaps.vGap24,

            // 密码
            TextFormField(
              decoration: InputDecoration(
                hintText: '请输入密码',
                hintStyle: TextStyle(
                  color: const Color(0xFFCCCCCC),
                  fontSize: Dimens.fontSp24,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.h, color: const Color(0xFFD9D9D9)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(width: 2.h, color: const Color(0xFFD9D9D9)),
                ),
              ),
              cursorColor: const Color(0xFFDC2E1E),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.go,
            ),

            Gaps.vGap60,

            // 登陆按钮
            StadiumButton(
              text: '登陆',
              press: () {
                print('登陆');
              },
            ),

            Gaps.vGap24,

            // 重置密码
            TextButton(
              child: Text(
                '重设密码',
                style: TextStyle(
                  color: const Color(0xFF5D7CA3),
                  fontSize: Dimens.fontSp18,
                ),
              ),
              onPressed: () {
                print('重设密码');
              },
            )
          ],
        ),
      ),
    );
  }
}
