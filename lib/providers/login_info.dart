import 'package:flutter/foundation.dart';

class LoginInfo extends ValueNotifier<String> {
  LoginInfo() : super('');

  String get token => value;

  bool get loggedIn => value.isNotEmpty;

  void login(String token) {
    value = token;
    notifyListeners();
  }

  void logout() {
    value = '';
    notifyListeners();
  }
}

final loginInfo = LoginInfo();
