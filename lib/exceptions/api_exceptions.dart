class ApiException implements Exception {
  static const Map<int, String> errors = {
    500: 'Houve um erro inesperado! Tente novamente',
  };
  final String msg;

  const ApiException(this.msg);

  @override
  String toString() {
    return msg;
  }
}
