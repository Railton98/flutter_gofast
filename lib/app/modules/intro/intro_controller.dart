import 'package:mobx/mobx.dart';

part 'intro_controller.g.dart';

class IntroController = _IntroControllerBase with _$IntroController;

abstract class _IntroControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
