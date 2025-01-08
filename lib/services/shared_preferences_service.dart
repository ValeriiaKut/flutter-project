import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _isLoggedInKey = 'isLoggedIn';

  static Future<bool> getLoginStatus(bool bool) async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
    if (kDebugMode) {
      print('Login status retrieved: $isLoggedIn');
    }
    return isLoggedIn;
  }

  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
    if (kDebugMode) {
      print('Login status saved: $isLoggedIn');
    }
  }
}


