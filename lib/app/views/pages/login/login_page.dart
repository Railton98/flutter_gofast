import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/login/login_controller.dart';
import '../../../core/localization/app_translate.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Seu e-mail'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: _height * 0.02),
              TextField(
                decoration: InputDecoration(hintText: 'Sua senha'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              SizedBox(height: _height * 0.06),
              RaisedButton(
                onPressed: () {},
                child: Text(
                  AppTranslate(context).text('intro.login_now'),
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
