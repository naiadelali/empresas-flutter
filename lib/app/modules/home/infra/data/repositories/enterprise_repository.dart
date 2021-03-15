import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/entities/response/enterprises.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/errors/errors.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/domain/repositories/enterprise_repository_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/home/infra/data/datasources/enterprise_datasource_interface.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

@Injectable()
class EnterpriseRepository implements IEnterpriseRepository {
  final IEnterpriseDatasource _datasource;

  EnterpriseRepository(this._datasource);

  @override
  Future<Either<Failure, List<EnterpriseEntityDomain>>> get() async {
    try {
      var result = <EnterpriseEntityDomain>[];
      var listEnterprise = await _datasource.get().then((enterprises) => {
            enterprises.forEach((e) => result.add(EnterpriseEntityDomain(
                  id: e.id,
                  enterpriseName: e.enterpriseName.toUpperCase(),
                  description: e.description,
                  photo: e.photo,
                )))
          });

      return Right(result);
    } on Failure catch (err) {
      return Left(err);
    } on DioError catch (e) {
      if (e.error is DioFailure)
        return Left(
            FailureGetEnterprises(message: (e.error as DioFailure).message));
      else
        return Left(FailureGetEnterprises(
            message: 'Falha ao fazer requisição ao servidor'));
    } on Exception catch (e) {
      return Left(FailureGetEnterprises(message: e.toString()));
    }
  }
}
