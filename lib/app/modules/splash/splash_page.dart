// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gofast/app/core/enums/app_enums.dart';
import 'package:gofast/app/core/interfaces/auth_repository_interface.dart';

import '../../app_controller.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // Firestore.instance.collection('books').document().setData({'title': 'title', 'author': 'author'});
    super.initState();
  }

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
            RaisedButton(
              child: Text('Login Google'),
              onPressed: () async {
                await Modular.get<IAuthRepositoryInterface>().doLoginGoogle().then(
                  (result) {
                    if (result.status == ResponseStatus.Success) {
                      print(result.message);
                    } else {
                      print(result.message);
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
