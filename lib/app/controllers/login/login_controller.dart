import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';

class LoginController {
  void doRegister() {
    Modular.to.pushNamed(RoutersConst.register);
  }
}
