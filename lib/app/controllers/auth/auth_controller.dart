import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/consts/routers_const.dart';
import '../../interfaces/auth_repository_interface.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  IAuthRepositoryInterface authRepository;

  _AuthControllerBase() {
    authRepository = Modular.get();
  }

  @observable
  String email = '';

  @observable
  String password = '';

  @computed
  bool get enableButton => email.isNotEmpty && password.isNotEmpty;

  @action
  void setEmail(String email) => this.email = email;

  @action
  void setPassword(String password) => this.password = password;

  Future<void> doLoginGoogle() async {
    await authRepository.doLoginGoogle().then((value) {
      if (value.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        print(value.message);
      }
    });
  }

  Future<void> doLoginEmailPassword() async {
    await authRepository
        .doLoginEmailPassword(email: email.trim(), password: password.trim())
        .then((response) {
      if (response.success) {
        Modular.to.pushReplacementNamed(RoutersConst.home);
      } else {
        throw response;
      }
    });
  }

  Future<void> doRegister() async {
    final response = await authRepository.registerEmailPassword(
      email: email,
      password: password,
    );

    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.home);
    } else {
      throw response;
    }
  }

  Future<void> doLogout() async {
    final response = await authRepository.logout();

    if (response.success) {
      Modular.to.pushReplacementNamed(RoutersConst.login);
    } else {
      throw response;
    }
  }
}
