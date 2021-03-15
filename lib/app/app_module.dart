import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/login_module.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/stores/auth_store.dart';
// import 'modules/login/login_module.dart';
import 'app_controller.dart';
import 'modules/home/home_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppController(i())),
    Bind.lazySingleton((i) => AuthStore()),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
