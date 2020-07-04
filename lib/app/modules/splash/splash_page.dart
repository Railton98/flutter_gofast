import 'package:flutter/material.dart';
import 'package:gofast/app/core/internationalization/app_translate.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(AppTranslate(context).text('welcome')),
      ),
    );
  }
}
