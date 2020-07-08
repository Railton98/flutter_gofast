import 'package:flutter/material.dart';
import '../../interfaces/theme_app_interface.dart';

class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() => ThemeData.dark();

  @override
  String themeToString() {
    return ThemeMode.dark.toString();
  }
}
