import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/entities/response/enterprises.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/errors/errors.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/repositories/enterprise_repository_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/presenter/pages/viewmodel/enterprise_vm.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

import 'interfaces/get_all_enterprise_interface.dart';

@Injectable()
class GetAllEnterprise implements IGetAllEnterprise {
  final IEnterpriseRepository _enterpriseRepository;

  GetAllEnterprise(this._enterpriseRepository);
  @override
  Future<Either<FailureGetEnterprises, EnterpriseVM>> call() async {
    var list = <Future<Either<Failure, List<EnterpriseEntityDomain>>>>[];

    var enterprises = <Either<Failure, List<EnterpriseEntityDomain>>>[];
    list.add(_enterpriseRepository.get());
    enterprises.addAll(await Future.wait(list));
    list = <Future<Either<Failure, List<EnterpriseEntityDomain>>>>[];
    if (list.isNotEmpty) enterprises.addAll(await Future.wait(list));

    List<EnterpriseEntityDomain> result = <EnterpriseEntityDomain>[];
    for (var item in enterprises) {
      if (item.isLeft()) {
        return Left(
            FailureGetEnterprises(message: "Falha ao processar a empresa!"));
      }
      item.fold(
        (l) => Left(l),
        (r) => result.addAll(r),
      );
    }

    return Right(EnterpriseVM(enterprises: result));
  }
}
