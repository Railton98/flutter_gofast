import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/consts/routers_const.dart';
import '../../../interfaces/auth_repository_interface.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    await Future.delayed(Duration(seconds: 2));

    IAuthRepositoryInterface repostory = Modular.get();
    var response = await repostory.getUser();
    FirebaseUser user = response.object;

    if (user == null) {
      Modular.to.pushReplacementNamed(RoutersConst.intro);
    } else {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
