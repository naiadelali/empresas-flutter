import 'package:dartz/dartz.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/entities/response/enterprises.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

abstract class IEnterpriseRepository {
  Future<Either<Failure, List<EnterpriseEntityDomain>>> get();
}
