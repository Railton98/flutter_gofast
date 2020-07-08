import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'intro_controller.dart';

class IntroPage extends StatefulWidget {
  final String title;
  const IntroPage({Key key, this.title = "Intro"}) : super(key: key);

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends ModularState<IntroPage, IntroController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
