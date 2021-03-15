// @dart=2.0
import 'package:flutter/material.dart';
import 'package:ioasys_flutter2_triple/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));
