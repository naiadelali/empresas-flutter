import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';

import 'package:ioasys_flutter2_triple/app/modules/login/presenter/pages/login/components/login_form/password_text_form_field/password_text_form_field_controller.dart';
import 'package:ioasys_flutter2_triple/app/shared/components/default_text_field/default_text_field_widget.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/custom_colors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/utils.dart';

import 'models/password_text_model.dart';
import 'stores/password_text_form_field_store.dart';

class PasswordTextFormFieldWidget extends StatefulWidget {
  final Function(String?) onChanged;
  final String label;
  final Function validator;
  final String? errorMessage;
  PasswordTextFormFieldWidget({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.validator,
    this.errorMessage,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldWidgetState createState() =>
      _PasswordTextFormFieldWidgetState();
}

class _PasswordTextFormFieldWidgetState extends ModularState<
    PasswordTextFormFieldWidget, PasswordTextFormFieldController> {
  @override
  void initState() {
    store.setError(widget.errorMessage ?? '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.setError(widget.errorMessage ?? '');
    return ScopedBuilder<PasswordTextFormFieldStore, Failure,
        PasswordTextFieldModel>(
      store: store.store,
      onState: (_, state) {
        return DefaultTextFieldWidget(
          labelText: widget.label,
          fontColor: Colors.black.withOpacity(0.8),
          backgroundColor: Colors.transparent,
          obscureText: !store.store.state.isvisible,
          errorMessage: store.store.state.errorMsg,
          suffixIcon: IconButton(
            onPressed: store.switchVisible,
            icon: store.store.state.isvisible
                ? Icon(Icons.visibility, color: CustomColors.ruby)
                : Icon(Icons.visibility_off, color: CustomColors.grey40),
          ),
          onChanged: widget.onChanged,
        );
      },
    );
  }
}
