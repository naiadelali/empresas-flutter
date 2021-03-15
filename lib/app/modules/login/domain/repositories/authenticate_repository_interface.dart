import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/entities/requests/request_authenticate.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/domain/errors/errors.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/models/requests/request_authenticate_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

abstract class IAuthenticateRepository {
  Future<Either<FailurePostAuthenticate, AuthModel>> post(
      RequestAuthenticateModel resquest);
}
