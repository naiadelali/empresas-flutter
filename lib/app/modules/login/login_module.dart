import 'package:ioasys_flutter2_triple/app/modules/login/presenter/pages/login/components/login_form/password_text_form_field/password_text_form_field_controller.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/consts.dart'
    as config;
import 'package:dio/dio.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/custom_dio/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'domain/usecases/post_authenticate_by_login.dart';
import 'infra/data/repositories/authenticate_repository.dart';
import 'infra/external/datasource/authenticate_ioasys_datasource.dart';
import 'presenter/pages/login/components/login_form/password_text_form_field/stores/password_text_form_field_store.dart';
import 'presenter/pages/login/login_controller.dart';
import 'presenter/pages/login/login_page.dart';

class LoginModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController(i(), i())),
    Bind.lazySingleton((i) => PasswordTextFormFieldStore()),
    Bind.lazySingleton((i) => PasswordTextFormFieldController(i())),
    Bind.lazySingleton((i) => AuthenticateIoasysDatasource(i())),
    Bind.lazySingleton((i) => AuthenticateRepository(i())),
    Bind.lazySingleton((i) => PostAuthenticateByLogin(i())),
    Bind.lazySingleton((i) => CustomDio(i())),
    Bind.lazySingleton((i) => BaseOptions(
          baseUrl: config.baseUrlLogin,
          connectTimeout: 5000,
        )),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => LoginPage()),
  ];
}
