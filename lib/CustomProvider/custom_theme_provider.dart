import 'package:a2z_online_learning/AppTheme/custom_app_theme.dart';
import 'package:flutter/material.dart';

var darkTheme = AppThemes.dark;
var lightTheme = AppThemes.lightTheme;

enum ThemeType { Light, Dark }

class CustomThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = lightTheme;
  ThemeType _themeType = ThemeType.Light;
  int toggleSwitchIndex = 0;

  toggleTheme() {
    if (_themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      _themeType = ThemeType.Light;
      toggleSwitchIndex = 0;
    } else if (_themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      _themeType = ThemeType.Dark;
      toggleSwitchIndex = 1;
    }
    return notifyListeners();
  }
}
