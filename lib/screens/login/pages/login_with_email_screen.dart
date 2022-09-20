import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../providers/login_info.dart';
import '../../../res/resources.dart';
import '../../../widgets/common/stadium_button.dart';

class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  String email = '';
  String password = '';

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
            TextField(
              decoration: const InputDecoration(
                hintText: '请输入邮箱账号',
              ),
              onChanged: (value) => email = value,
              cursorColor: Colours.brand,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
            ),

            Gaps.vGap24,

            // 密码
            TextField(
              decoration: const InputDecoration(
                hintText: '请输入密码',
              ),
              onChanged: (value) => password = value,
              cursorColor: Colours.brand,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.go,
            ),

            Gaps.vGap60,

            // 登陆按钮
            StadiumButton(
              text: '登陆',
              press: () async {
                final response = await Dio().get(
                  '$baseUrl/login',
                  queryParameters: {
                    'email': email,
                    'password': password,
                  },
                );

                final token = response.data['token'];

                loginInfo.login(token);
              },
            ),

            Gaps.vGap24,

            // 重置密码
            TextButton(
              child: Text(
                '重设密码',
                style: TextStyles.tipText,
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
