import 'package:flutter_modular/flutter_modular.dart';

import 'package:ioasys_flutter2_triple/app/modules/home/domain/usecases/interfaces/get_all_enterprise_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/stores/home_store.dart';

// part 'home_controller.g.dart';

@Injectable()
class HomeController {
  final IGetAllEnterprise _getAllEnterprise;
  final HomeStore store;

  HomeController(
    this._getAllEnterprise,
    this.store,

  );

   Future<void> getEnterprises() async {
    var result = await _getAllEnterprise();

    store.setEnterprises(result);
  }
}
