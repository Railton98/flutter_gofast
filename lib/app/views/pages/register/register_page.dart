import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/register/register_controller.dart';
import '../../widgets/scroll_widget.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ScrollWidget(
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
