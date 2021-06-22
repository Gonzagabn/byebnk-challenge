import 'dart:async';
import 'dart:convert';

import 'package:byebnk_app/exceptions/http_exceptions.dart';
import 'package:byebnk_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Investment {
  DateTime date;
  double value;

  Investment({
    required this.date,
    required this.value,
  });
}

class Investments with ChangeNotifier {
  String? _token;
  Investment? _investment;

  Investments(this._token);

  Investment get investment => _investment!;

  Future<void> investmentRequest(double value) async {
    final url = Uri.parse(Constants.INV_URL);
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": _token!,
      },
      body: json.encode({
        'valor': value,
      }),
    );

    final data = json.decode(response.body);
    if (response.statusCode == 500) {
      throw HttpException(response.statusCode.toString());
    } else if (data != null) {
      _investment!.date = DateTime.parse(data['data']);
      _investment!.value = data['valor'];
    }
    notifyListeners();

    return Future.value();
  }
}
