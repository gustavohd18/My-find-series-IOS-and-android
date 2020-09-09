import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:myFindMovies/service/authentication/authentication_service.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final _authentication = Modular.get<AuthenticationService>();

  _SplashControllerBase() {
    _onAuthChanged();
  }

  @observable
  String addUser;

  void _onAuthChanged() {
    _authentication.getFirebaseAuth().authStateChanges().listen((user) {
      final String uid = user != null ? user.uid : null;
      addUser = uid;
    });
  }
}
