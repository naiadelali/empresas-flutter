import 'package:dio/native_imp.dart';
import 'package:dio/src/response.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/data/datasources/authenticate_datasource_interface.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/infra/models/requests/request_authenticate_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';

@Injectable()
class AuthenticateIoasysDatasource implements IAuthenticateDatasource {
  final DioForNative _client;

  AuthenticateIoasysDatasource(this._client);
  @override
  Future<AuthModel> post(RequestAuthenticateModel auth) async {
    final response = await _client.post("/users/auth/sign_in",
        queryParameters: {"email": auth.login, "password": auth.password});

    if (response.statusCode == 200 && response.data['success']) {
      var model = AuthModel.fromHeader(response.headers);
      model.email = auth.login;
      model.password = auth.password;
      return model;
    } else {
      throw DatasourceError(message: "Falha");
    }
  }
}
