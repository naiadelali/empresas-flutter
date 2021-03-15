import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/presenter/pages/login/components/login_form/password_text_form_field/stores/password_text_form_field_store.dart';

@Injectable()
class PasswordTextFormFieldController {
  final PasswordTextFormFieldStore store;
  PasswordTextFormFieldController(
    this.store,
  );
  void switchVisible() => store.setPasswordVisibility(!store.state);
}
