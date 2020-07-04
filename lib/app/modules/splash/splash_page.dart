import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gofast/app/core/internationalization/app_translate.dart';

import '../../app_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => Modular.get<AppController>().setThemeData(ThemeMode.dark),
              child: Text('Theme Dark'),
            ),
            RaisedButton(
              onPressed: () => Modular.get<AppController>().setThemeData(ThemeMode.light),
              child: Text('Theme Light'),
            ),
          ],
        ),
      ),
    );
  }
}
