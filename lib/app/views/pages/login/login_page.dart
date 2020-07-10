import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/login/login_controller.dart';
import '../../../core/localization/app_translate.dart';
import '../../widgets/scroll_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  AuthController _authController;

  @override
  void initState() {
    _authController = Modular.get<AuthController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: ScrollWidget(
        children: <Widget>[
          TextField(
            onChanged: _authController.setEmail,
            decoration: InputDecoration(hintText: 'Seu e-mail'),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: _height * 0.02),
          TextField(
            onChanged: _authController.setPassword,
            decoration: InputDecoration(hintText: 'Sua senha'),
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(height: _height * 0.06),
          Observer(
            name: 'LoginButton',
            builder: (context) {
              return RaisedButton(
                onPressed: _authController.enableButton
                    ? () async {
                        await _authController.doLoginEmailPassword().catchError(
                          (error) {
                            var scnackbar = SnackBar(
                              content: Text(error.message),
                            );
                            Scaffold.of(context).showSnackBar(scnackbar);
                          },
                        );
                      }
                    : null,
                child: Text(
                  AppTranslate(context).text('intro.login_now'),
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
            },
          ),
          SizedBox(height: _height * 0.06),
          RaisedButton(
            color: Colors.red,
            onPressed: _authController.doLoginGoogle,
            child: Text(
              AppTranslate(context).text('intro.login_google'),
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          SizedBox(height: _height * 0.06),
          RaisedButton(
            color: Colors.grey,
            onPressed: controller.doRegister,
            child: Text(
              'REGISTRAR-SE',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
