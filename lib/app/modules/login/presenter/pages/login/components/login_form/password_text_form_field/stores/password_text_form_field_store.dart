import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:mobx_triple/mobx_triple.dart';

@Injectable()
class PasswordTextFormFieldStore extends MobXStore<Failure, bool> {
  PasswordTextFormFieldStore() : super(false);
  void setPasswordVisibility(bool v) => update(v);
}
