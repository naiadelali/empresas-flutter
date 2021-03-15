import 'package:ioasys_flutter2_triple/app/modules/login/domain/entities/requests/request_authenticate.dart';
import 'package:dio/src/response.dart';
import 'package:dartz/dartz.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/errors/errors.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/repositories/authenticate_repository_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/usecases/interfaces/post_authenticate_by_login_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/models/requests/request_authenticate_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

class PostAuthenticateByLogin implements IPostAuthenticateByLogin {
  final IAuthenticateRepository _authenticateRepository;

  PostAuthenticateByLogin(this._authenticateRepository);
  @override
  Future<Either<FailurePostAuthenticate, AuthModel>> call(
      RequestAuthenticate resquest) async {
    if (resquest == null || !resquest.isValid) {
      return Left(FailurePostAuthenticate(
          message: 'Login ou senha esta com preenchimento inválido'));
    }
    var model = RequestAuthenticateModel(
      login: resquest.login,
      password: resquest.password,
    );
    Either<FailurePostAuthenticate, AuthModel> response =
        await _authenticateRepository.post(model);

    return response;
  }
}
