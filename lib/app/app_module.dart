import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gofast/app/core/interfaces/shared_repository_interface.dart';
import 'package:gofast/app/core/repositories/shared_repository.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind<ISharedRepositoryInterface>((i) => SharedRepository()),
        Bind((i) => AppController()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage(), transition: TransitionType.noTransition),
        Router('/home', module: HomeModule()),
      ];
}
