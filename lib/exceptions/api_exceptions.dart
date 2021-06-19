class ApiException implements Exception {
  static const Map<String, String> error = {
    'Fake error to test how your application can handle unexpected events':
        'Houve um erro FAKE inesperado! Tente novamente',
  };
  final String msg;

  const ApiException(this.msg);

  @override
  String toString() {
    return msg;
  }
}
