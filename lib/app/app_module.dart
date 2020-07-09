import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/consts/routers_const.dart';
import 'interfaces/auth_repository_interface.dart';
import 'interfaces/shared_repository_interface.dart';
import 'modules/home_module.dart';
import 'modules/intro_module.dart';
import 'modules/login_module.dart';
import 'repositories/auth_repository.dart';
import 'repositories/shared_repository.dart';
import 'views/pages/splash/splash_page.dart';

class AppModule extends MainModule {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  List<Bind> get binds => [
        Bind<ISharedRepositoryInterface>(
          (i) => SharedRepository(),
        ),
        Bind<IAuthRepositoryInterface>(
          (i) => AuthRepository(firebaseAuth),
        ),
        Bind(
          (i) => AppController(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router(
          RoutersConst.splash,
          child: (_, args) => SplashPage(),
          transition: TransitionType.noTransition,
        ),
        Router(RoutersConst.intro, module: IntroModule()),
        Router(RoutersConst.login, module: LoginModule()),
        Router(RoutersConst.home, module: HomeModule()),
      ];
}
