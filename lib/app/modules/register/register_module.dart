import 'package:flutter_modular/flutter_modular.dart';

import '../../controllers/register/register_controller.dart';
import '../../views/pages/register/register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
