import 'dart:async';
import 'dart:convert';

import 'package:byebnk_app/exceptions/api_exceptions.dart';
import 'package:byebnk_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Transaction {
  final String type;
  final DateTime date;
  final double value;

  Transaction({
    required this.type,
    required this.date,
    required this.value,
  });
}

class Transactions with ChangeNotifier {
  String? _token;
  List<Transaction> _transactions = [];

  Transactions([this._token, this._transactions = const []]);

  List<Transaction> get transactions => [..._transactions];

  Future<void> loadTransactions() async {
    final url = Uri.parse(Constants.TXNS_URL);

    final response = await http.get(
      url,
      headers: {"Authorization": _token!},
    );

    final responseBody = json.decode(response.body);
    if (responseBody['errors'] != null) {
      throw ApiException(responseBody['errors']);
    } else {
      notifyListeners();
    }

    print(responseBody);

    return Future.value();
  }
}
