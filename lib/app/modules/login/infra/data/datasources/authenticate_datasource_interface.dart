import 'package:dio/dio.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/models/requests/request_authenticate_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';

abstract class IAuthenticateDatasource {
  Future<AuthModel> post(RequestAuthenticateModel auth);
}
