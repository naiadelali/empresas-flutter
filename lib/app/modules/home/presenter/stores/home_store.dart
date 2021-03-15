import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/viewmodel/enterprise_vm.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/errors/errors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

// part 'home_store.g.dart';

class HomeStore extends MobXStore<Failure, EnterpriseVM> {
  HomeStore() : super(EnterpriseVM());

  void setFilter(String value) {
    var newState = state.copyWith(filter: value);
    execute(() async => newState);
  }

  void setEnterprises(Either<FailureGetEnterprises, EnterpriseVM> value) {
    executeEither(() async => value, delay: Duration(milliseconds: 500));
  }
}
