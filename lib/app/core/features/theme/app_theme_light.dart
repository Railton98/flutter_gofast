import 'package:flutter/material.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() => ThemeData.light();

  @override
  String themeToString() {
    return ThemeMode.light.toString();
  }
}
