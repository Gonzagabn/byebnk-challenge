class AuthException implements Exception {
  static const Map<String, String> errors = {
    'invalid username or password': 'E-mail e/ou senha inválidos!',
  };
  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key]!;
    } else {
      return "Ocorreu um erro na autenticação!";
    }
  }
}
