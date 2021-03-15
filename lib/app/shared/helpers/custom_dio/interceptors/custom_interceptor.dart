import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/stores/auth_store.dart';

//import '../../../stores/user_store.dart';
import '../../../../app_controller.dart';
import '../../errors.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    var store = Modular.get<AuthStore>();

    var token = store.state.apiToken;
    var client = store.state.client;
    var uid = store.state.uid;

    //userService.user?.token ?? '';
    if (token.isNotEmpty) {
      var headerAuth = _genToken(token);
      options.headers['Authorization'] = headerAuth;
    }
    if (!options.path.contains("/users/auth/sign_in")) {
      options.headers.addAll({
        "Content-Type": "application/json",
        "access-token": token,
        "client": client,
        "uid": uid,
      });
    }
    //Imprimindo informações do request para debug
    if (kDebugMode) {
      debugPrint(json.encode("BaseURL: ${options.baseUrl}"));
      debugPrint(json.encode("Endpoint: ${options.path}"));
      if (options.headers['access-token'] != null) {
        debugPrint("access-token: ${options.headers['access-token']}");
      }
      if (options.data != null) {
        debugPrint("Payload ${json.encode(options.data)}");
      }
    }

    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) async {
    if (err.response?.statusCode == 401) {
      DioFailure(
          message: err.response.data ?? 'Faça o login novamente.',
          statusCode: err.response?.statusCode ?? 500);
    }
    if (err.response?.statusCode == 400) {
      var msg = err.response.data["notifications"] == null
          ? err.error
          : err.response.data["notifications"][0]["message"];

      return DioFailure(message: msg, statusCode: err.response.statusCode);
    }
    return DioFailure(
        message:
            err.response.data ?? 'Ocorreu um erro na requisição com o servidor',
        statusCode: err.response?.statusCode ?? 500);
  }

  String _genToken(String token) {
    return 'Bearer $token';
  }
}
