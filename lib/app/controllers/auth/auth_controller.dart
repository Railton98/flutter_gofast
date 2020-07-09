import 'package:flutter_modular/flutter_modular.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

class AuthController {
  IAuthRepositoryInterface authRepository;

  AuthController() {
    authRepository = Modular.get();
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

  Future<void> doLoginEmailPassword(String email, String password) async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((value) {
      if (value.success) {
        Modular.to.pushNamed(RoutersConst.home);
      } else {
        print(value.message);
      }
    });
  }
}
