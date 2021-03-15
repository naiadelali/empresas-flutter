import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/presenter/pages/login/components/login_form/password_text_form_field/password_text_form_field_controller.dart';
import 'package:ioasys_flutter2_triple/app/shared/components/default_text_field/default_text_field_widget.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/custom_colors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/utils.dart';

import 'stores/password_text_form_field_store.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final Function(String?) onChanged;
  final String label;
  final Function validator;

  PasswordTextFormFieldWidget({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.validator,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldWidgetState createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends ModularState<
    PasswordTextFormFieldWidget, PasswordTextFormFieldController> {
  @override
  Widget build(BuildContext context) {
    return ScopedBuilder<PasswordTextFormFieldStore, Failure, bool>(
      store: store.store,
      onState: (_, state) {
        return DefaultTextFieldWidget(
          labelText: 'Senha',
          fontColor: Colors.black.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          obscureText: !store.store.state,
          // errorMessage: store.store.getErrorMessage(),
          suffixIcon: IconButton(
            onPressed: store.switchVisible,
            icon: store.store.state
                ? Icon(Icons.visibility, color: CustomColors.grey40)
                : Icon(Icons.visibility_off, color: CustomColors.grey40),
          ),
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
