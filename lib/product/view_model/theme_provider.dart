import 'package:flutter/material.dart';

import '../../common/shared_pref.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode appThemeMode = ThemeMode.light;
  bool get isDark => appThemeMode == ThemeMode.dark;

  ThemeProvider() {
    _initializeThemeMode();
  }

  Future<void> _initializeThemeMode() async {
    bool isDark = SharedPrefs().getBool('isDark') ?? false;
    appThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  changeThemeMode(ThemeMode themeMode) {
    appThemeMode = themeMode;
    SharedPrefs().setBool('isDark', isDark);
    notifyListeners();
  }
}
