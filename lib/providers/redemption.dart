import 'dart:async';
import 'dart:convert';

import 'package:byebnk_app/exceptions/http_exceptions.dart';
import 'package:byebnk_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Redemption {
  DateTime date;
  double value;

  Redemption({
    required this.date,
    required this.value,
  });
}

class Redemptions with ChangeNotifier {
  String? _token;
  Redemption? _redemption;

  Redemptions(this._token);

  Redemption? get redemption => _redemption;

  Future<void> redemptionRequest(double value) async {
    final url = Uri.parse(Constants.RED_URL);
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
      _redemption!.date = data['data'];
      _redemption!.date = data['valor'];
    }
    notifyListeners();

    return Future.value();
  }
}
