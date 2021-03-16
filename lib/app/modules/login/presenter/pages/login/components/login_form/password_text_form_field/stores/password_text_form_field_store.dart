import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/presenter/pages/login/components/login_form/password_text_form_field/models/password_text_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:mobx_triple/mobx_triple.dart';

@Injectable()
class PasswordTextFormFieldStore
    extends MobXStore<Failure, PasswordTextFieldModel> {
  PasswordTextFormFieldStore() : super(PasswordTextFieldModel());
  void setPasswordVisibility(bool v) => update(state.copyWith(isvisible:v));
  void setErrorMsg(String? v) => update(state.copyWith(errorMsg:v));
}
