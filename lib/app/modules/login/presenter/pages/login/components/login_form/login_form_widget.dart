import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/modules/login/presenter/pages/login/components/login_form/password_text_form_field/password_text_form_field_widget.dart';

import 'package:ioasys_flutter2_triple/app/shared/components/default_flat_button/default_flat_button_widget.dart';
import 'package:ioasys_flutter2_triple/app/shared/components/default_text_field/default_text_field_widget.dart';
import 'package:ioasys_flutter2_triple/app/shared/components/loading_progress_indicator/loading_progress_indicator_widget.dart';

class LoginFormWidget extends StatelessWidget {
  final bool loading;
  final VoidCallback loginPressed;
  final Function(String?) emailChanged;
  final Function(String?) passwordChanged;
  final String? errorMsg;
  const LoginFormWidget({
    Key? key,
    required this.loading,
    required this.loginPressed,
    required this.emailChanged,
    required this.passwordChanged,
    this.errorMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                DefaultTextFieldWidget(
                    labelText: 'Email',
                    fontColor: Colors.black.withOpacity(0.8),
                    backgroundColor: Colors.transparent,
                    onChanged: emailChanged,
                    errorMessage: errorMsg),
                SizedBox(height: 20),
                PasswordTextFormFieldWidget(
                    onChanged: passwordChanged,
                    validator: () => {},
                    label: 'Senha',
                    errorMessage: errorMsg),
                Visibility(
                  visible: (errorMsg?.length ?? 0) != 0,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      errorMsg ?? '',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: DefaultFlatButtonWidget(
                        label: "ENTRAR",
                        onPressed: loginPressed,
                      ),
                    )
                  ],
                ),
              ]),
        ),
      ],
    );
  }
}
