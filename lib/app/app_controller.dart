import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/stores/auth_store.dart';

@Injectable()
class AppController {
  final AuthStore store;

  AppController(this.store);

}
