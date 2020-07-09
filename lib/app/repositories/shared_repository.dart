import 'package:flutter/material.dart';

import '../core/local_storage/local_storage.dart';
import '../interfaces/shared_repository_interface.dart';

class SharedRepository implements ISharedRepositoryInterface {
  static const String constThemeMode = 'constThemeMode';
  static const String constThemeModeDark = 'ThemeMode.dark';
  static const String constThemeModeLight = 'ThemeMode.light';

  @override
  String readUserInfo() {
    return null;
  }

  @override
  void saveUserInfo(String userInfo) {}

  @override
  Future<ThemeMode> readThemeMode() async {
    return await LocalStorage.getValue<String>(constThemeMode).then((value) {
      switch (value) {
        case constThemeModeDark:
          return ThemeMode.dark;
          break;
        case constThemeModeLight:
          return ThemeMode.light;
          break;
        default:
          return ThemeMode.light;
          break;
      }
    });
  }

  @override
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    return await LocalStorage.setValue<String>(
        constThemeMode, themeMode.toString());
  }
}
