import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

class IntroController {
  IAuthRepositoryInterface authRepository;

  IntroController() {
    authRepository = Modular.get();
  }

  void doEnter() {
    Modular.to.pushNamed(RoutersConst.login);
  }

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((value) {
      if (value.success) {
        Modular.to.pushNamed(RoutersConst.home);
      } else {
        print(value.message);
      }
    });
  }
}
