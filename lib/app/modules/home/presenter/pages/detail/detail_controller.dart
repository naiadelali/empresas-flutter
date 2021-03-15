import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/entities/response/enterprises.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/viewmodel/enterprise_detail_vm.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/stores/home_store.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

// part 'detail_controller.g.dart';

@Injectable()
class DetailController extends MobXStore<Failure, EnterpriseDetailVM> {
  final EnterpriseEntityDomain enterprise;
  final HomeStore store;

  DetailController(@Data this.enterprise, this.store)
      : super(EnterpriseDetailVM(enterprise: enterprise));

  void setPage(int value) {
    var enterprise = store.state.enterprises[value];

    execute(() async => state.copyWith(enterprise: enterprise, page: value));
  }
}
