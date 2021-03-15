import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:mobx_triple/mobx_triple.dart';

@Injectable()
class AuthStore extends MobXStore<Failure, AuthModel> {
  AuthStore() : super(AuthModel());
  void setEmail(String v) => state.email = v;

  void setPassword(String v) => state.password = v;
  Future<void> setLogin(Either<Failure, AuthModel> value) async {
    await executeEither(() async => value, delay: Duration(milliseconds: 500));
  }
}
