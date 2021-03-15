import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/entities/requests/request_authenticate.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/usecases/interfaces/post_authenticate_by_login_interface.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/stores/auth_store.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:ioasys_flutter2_triple/app/shared/components/loading_progress_indicator/loading_progress_indicator_widget.dart';

class LoginController {
  final IPostAuthenticateByLogin _authenticateByLogin;
  final AuthStore store;

  LoginController(this._authenticateByLogin, this.store);

  void setEmail(String? v) => store.setEmail(v!);
  void setPassword(String? v) => store.setPassword(v!);
  Future<void> login(String login, String password) async {
    var overlay = OverlayEntry(
      builder: (context) {
        return LoadingProgressIndicatorWidget(
          isCustom: true,
        );
      },
    );
    asuka.addOverlay(overlay);
    await Future.delayed(Duration(seconds: 2));
    var requestAuthenticate =
        new RequestAuthenticate(login: login, password: password);

    var request = requestAuthenticate;
    var result = await _authenticateByLogin(request);

    await store.setLogin(result);
    print(store.state);
    overlay.remove();
    if (result is Right) {
      Modular.to.navigate('/home');
    }
  }
}
