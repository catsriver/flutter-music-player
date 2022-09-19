import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/stadium_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // logo
            Container(
              width: 450,
              height: 450,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                gradient: RadialGradient(
                  colors: [Color(0x0fffffff), Color(0xFFCCCCCC)],
                  radius: 1 / 4,
                  stops: [.99, .1],
                  tileMode: TileMode.repeated,
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                width: 108,
                height: 108,
              ),
            ),

            const Spacer(flex: 5),

            // 登陆按钮
            StadiumButton(
              text: '手机号登陆',
              press: () {
                print('手机号登陆');
              },
            ),

            const Spacer(flex: 1),

            // 服务条款
            Row(
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                RichText(
                  text: TextSpan(
                    text: '我已阅读并同意',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xFFB2B2B2),
                    ),
                    children: [
                      TextSpan(
                        text: '《服务条款》',
                        style: const TextStyle(color: Color(0xFF5D7CA3)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('点击服务条款');
                          },
                      ),
                      const TextSpan(
                        text: '、',
                        style: TextStyle(color: Color(0xFF5D7CA3)),
                      ),
                      TextSpan(
                        text: '《隐私政策》',
                        style: const TextStyle(color: Color(0xFF5D7CA3)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('点击隐私政策');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const Spacer(flex: 4),

            // 其它登陆方式
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Image.asset(
                    'assets/images/wechat.png',
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/images/qq.png'),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/images/weibo.png'),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Image.asset('assets/images/netease.png'),
                  onPressed: () {},
                ),
              ],
            ),

            const Spacer(flex: 1),

            // 遇到问题
            const Text(
              '登陆遇到问题',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xFFB2B2B2),
              ),
            ),

            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}
