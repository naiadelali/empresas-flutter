class RequestAuthenticate {
  final String login;
  final String password;
  RequestAuthenticate({
    required this.login,
    required this.password,
  });
  bool get isValid => login.isNotEmpty && password.isNotEmpty;
}
