class AuthException implements Exception {
  static const Map<String, String> errors = {
    'invalid username or password': 'E-mail e/ou senha inválidos!',
  };
  final String msg;

  const AuthException(this.msg);

  @override
  String toString() {
    if (errors.containsKey(msg)) {
      return errors[msg]!;
    } else {
      return "Ocorreu um erro na autenticação!";
    }
  }
}
