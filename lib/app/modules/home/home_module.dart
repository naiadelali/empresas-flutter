import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/detail/detail_controller.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/detail/detail_page.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/consts.dart'
    as config;
import 'package:dio/dio.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/custom_dio/custom_dio.dart';
import 'domain/usecases/get_all_enterprise.dart';
import 'infra/data/repositories/enterprise_repository.dart';
import 'infra/external/datasource/enterprise_datasource.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/stores/home_store.dart';

class HomeModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DetailController(i.args!.data, i())),
    Bind.lazySingleton((i) => HomeController(i(), i())),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => EnterpriseDatasource(i())),
    Bind.lazySingleton((i) => EnterpriseRepository(i())),
    Bind.lazySingleton((i) => GetAllEnterprise(i())),
    Bind.lazySingleton((i) => CustomDio(i())),
    Bind.lazySingleton((i) => BaseOptions(
          baseUrl: config.baseUrlLogin,
          connectTimeout: 5000,
        )),
  ];

  // Provide all the routes for your module
  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ChildRoute('enterprise/:id', child: (_, args) => DetailPage()),
  ];
}
