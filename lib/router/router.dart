import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/home/home_screen.dart';
import '../screens/login/login_screen.dart';
import '../screens/login/login_with_email_screen.dart';
import '../screens/login/login_with_phone_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/login',
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
