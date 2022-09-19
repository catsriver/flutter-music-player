import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../res/resources.dart';
import '../../widgets/common/stadium_button.dart';
import '../../widgets/common/third_party_login_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // 用户是否阅读并同意
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // logo
            Container(
              width: 450.w,
              height: 450.w,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                color: Colors.indigo,
                gradient: RadialGradient(
                  colors: [Colors.transparent, Colors.black12],
                  radius: 108 / 450,
                  stops: [.99, 1],
                  tileMode: TileMode.repeated,
                ),
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/logo.png',
                width: 108.w,
                height: 108.w,
              ),
            ),

            const Spacer(flex: 5),

            // 登陆按钮
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80.w),
              child: StadiumButton(
                text: '手机号登陆',
                press: () {
                  print('手机号登陆');
                },
              ),
            ),

            const Spacer(flex: 1),

            // 服务条款
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isAgreed,
                  onChanged: (value) {
                    setState(() {
                      isAgreed = value!;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: '我已阅读并同意',
                    style: TextStyle(
                      fontSize: Dimens.fontSp18,
                      color: const Color(0xFFB2B2B2),
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
                ThirdPartyLoginButton(
                  iconUrl: 'assets/images/wechat.png',
                  press: () {
                    print('微信登陆');
                  },
                ),
                ThirdPartyLoginButton(
                  iconUrl: 'assets/images/qq.png',
                  press: () {
                    print('QQ登陆');
                  },
                ),
                ThirdPartyLoginButton(
                  iconUrl: 'assets/images/weibo.png',
                  press: () {
                    print('微博登陆');
                  },
                ),
                ThirdPartyLoginButton(
                  iconUrl: 'assets/images/netease.png',
                  press: () async {
                    if (isAgreed) {
                      context.goNamed('loginWithEmail');
                    } else {
                      final result = await _showBottomSheet(context);
                      if (result) {
                        // 用户选择了同意并继续
                        setState(() {
                          isAgreed = result;
                        });
                        context.goNamed('loginWithEmail');
                      }
                    }
                  },
                ),
              ],
            ),

            const Spacer(flex: 1),

            // 遇到问题
            Text(
              '登陆遇到问题',
              style: TextStyle(
                fontSize: Dimens.fontSp18,
                color: const Color(0xFFB2B2B2),
              ),
            ),

            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }

  Future<bool> _showBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radiusDp24),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.hGapDp24 * 2,
          vertical: Dimens.vGapDp24,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gaps.vGap24,
            Text(
              '服务协议和隐私政策等指引',
              style: TextStyle(
                fontSize: Dimens.fontSp26,
                color: const Color(0xFF333333),
                fontWeight: FontWeight.bold,
              ),
            ),
            Gaps.vGap24,
            RichText(
              text: TextSpan(
                text: '进入下一步前，请阅读并同意网易云音乐的',
                style: TextStyle(
                  fontSize: Dimens.fontSp20,
                  color: const Color(0xFFB2B2B2),
                ),
                children: const [
                  TextSpan(
                    text: '《服务条款》',
                    style: TextStyle(color: Color(0xFF5D7CA3)),
                  ),
                  TextSpan(
                    text: '、',
                    style: TextStyle(color: Color(0xFF5D7CA3)),
                  ),
                  TextSpan(
                    text: '《隐私政策》',
                    style: TextStyle(color: Color(0xFF5D7CA3)),
                  ),
                ],
              ),
            ),
            Gaps.vGap24,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: StadiumButton(
                    text: '不同意',
                    outline: true,
                    press: () => Navigator.of(context).pop(false),
                  ),
                ),
                Gaps.hGap14,
                Flexible(
                  child: StadiumButton(
                    text: '同意并继续',
                    press: () => Navigator.of(context).pop(true),
                  ),
                ),
              ],
            ),
            Gaps.vGap24,
          ],
        ),
      ),
    );
  }
}
