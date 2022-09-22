import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../providers/login_info.dart';
import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/pages/login_with_email_screen.dart';
import '../screens/login/pages/login_with_phone_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/login',
  refreshListenable: loginInfo,
  redirect: _redirectLogic,
  routes: [
    GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const HomeScreen(),
      ),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const LoginScreen(),
      ),
      routes: [
        GoRoute(
          name: 'loginWithEmail',
          path: 'email',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const LoginWithEmailScreen(),
          ),
        ),
        GoRoute(
          name: 'loginWithPhone',
          path: 'phone',
          pageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: const LoginWithPhoneScreen(),
          ),
        ),
      ],
    ),
  ],
);

String? _redirectLogic(GoRouterState state) {
  final loggingIn = state.location.startsWith('/login');
  final loggedIn = loginInfo.loggedIn;

  // 如果用户未登陆，则需要进行登陆
  if (!loggedIn) return loggingIn ? null : '/login';

  // 如果用户已经登陆，但处于登陆页面，则重定向到首页
  if (loggingIn) return '/';

  return null;
}
