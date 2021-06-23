class HttpException implements Exception {
  static const Map<String, String> statusCode = {
    '500': 'Tente novamente!',
  };
  final String msg;

  const HttpException(this.msg);

  @override
  String toString() {
    if (statusCode.containsKey(msg)) {
      return statusCode[msg]!;
    } else {
      return "Ocorreu um erro no comunicação com servidor!";
    }
  }
}
