import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/errors/errors.dart';
import 'package:dio/src/response.dart';
import 'package:dartz/dartz.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/repositories/authenticate_repository_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/data/datasources/authenticate_datasource_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/models/requests/request_authenticate_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

@Injectable()
class AuthenticateRepository implements IAuthenticateRepository {
  final IAuthenticateDatasource _datasource;

  AuthenticateRepository(this._datasource);
  @override
  Future<Either<FailurePostAuthenticate, AuthModel>> post(
      RequestAuthenticateModel resquest) async {
    try {
      final result = await _datasource.post(resquest);

      return Right(result);
    } on Failure catch (err) {
      return Left(FailurePostAuthenticate(message: 'Falha na autenticação!'));
    } on DioError catch (e) {
      if (e.error is DioFailure)
        return Left(
            FailurePostAuthenticate(message: (e.error as DioFailure).message));
      else
        return Left(FailurePostAuthenticate(message: 'Falha na autenticação'));
    } on Exception catch (e) {
      return Left(FailurePostAuthenticate(message: e.toString()));
    }
  }
}
