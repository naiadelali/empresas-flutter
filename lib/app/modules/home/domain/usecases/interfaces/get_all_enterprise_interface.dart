import 'package:dartz/dartz.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/errors/errors.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/viewmodel/enterprise_vm.dart';

abstract class IGetAllEnterprise {
  Future<Either<FailureGetEnterprises, EnterpriseVM>> call();
}
