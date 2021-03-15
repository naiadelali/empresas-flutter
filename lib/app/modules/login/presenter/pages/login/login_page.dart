import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/models/auth_model.dart';
import 'package:ioasys_flutter2_triple/app/shared/auth/stores/auth_store.dart';
import 'package:ioasys_flutter2_triple/app/shared/helpers/errors.dart';
import 'components/header/header_widget.dart';
import 'components/login_form/login_form_widget.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: HeaderWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ScopedBuilder<AuthStore, Failure, AuthModel>(
              store: store.store,
              onLoading: (_) => Center(child: CircularProgressIndicator()),
              onError: (_, error) =>
                  buildForm(error?.message, store.store.state),
              onState: (_, state) =>
                  buildForm(store.store.error?.message, store.store.state),
            ),
          ]),
        ),
      ),
    );
  }

  Widget buildForm(String? messageError, AuthModel model) {
    return LoginFormWidget(
      loading: false,
      emailChanged: store.setEmail,
      errorMsg: messageError,
      passwordChanged: store.setPassword,
      loginPressed: () => store.login(model.email, model.password),
    );
  }
}
