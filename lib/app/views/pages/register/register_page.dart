import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/auth/auth_controller.dart';
import '../../../controllers/register/register_controller.dart';
import '../../widgets/scroll_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
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
      appBar: AppBar(title: Text('Registrar-se')),
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
          Observer(builder: (context) {
            return RaisedButton(
              onPressed: _authController.enableButton
                  ? () async {
                      await _authController.doRegister().catchError((error) {
                        var snackbar = SnackBar(content: Text(error.message));
                        Scaffold.of(context).showSnackBar(snackbar);
                      });
                    }
                  : null,
              child: Text(
                'REGISTRAR-SE',
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            );
          }),
        ],
      ),
    );
  }
}
