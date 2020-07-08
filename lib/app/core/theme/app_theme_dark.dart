import 'package:flutter/material.dart';
import 'package:gofast/app/core/interfaces/theme_app_interface.dart';

class AppThemeDark implements IThemeAppInterface {
  @override
  ThemeData getTheme() => ThemeData.dark();
}
