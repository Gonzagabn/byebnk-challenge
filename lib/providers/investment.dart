import 'dart:async';
import 'dart:convert';

import 'package:byebnk_app/exceptions/http_exceptions.dart';
import 'package:byebnk_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Investment with ChangeNotifier {
  String? _token;
  DateTime? _date;
  double? _value;

  DateTime get date => _date!;
  double get value => _value!;

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
      _value = data['valor'];
      _date = data['data'];
    }
    notifyListeners();

    return Future.value();
  }
}
