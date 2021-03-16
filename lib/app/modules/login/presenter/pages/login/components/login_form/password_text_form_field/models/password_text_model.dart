import 'dart:convert';

import 'package:dio/dio.dart';

class PasswordTextFieldModel {
  bool isvisible;
  String? errorMsg;
  PasswordTextFieldModel({
    this.isvisible = false,
    this.errorMsg,
  });

  PasswordTextFieldModel copyWith({
    bool? isvisible,
    String? errorMsg,
  }) {
    return PasswordTextFieldModel(
      isvisible: isvisible ?? this.isvisible,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}
