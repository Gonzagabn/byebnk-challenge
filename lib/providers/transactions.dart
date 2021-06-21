import 'dart:async';
import 'dart:convert';

import 'package:byebnk_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Transaction {
  final String type;
  final String date;
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

  int get transactionsCount {
    return _transactions.length;
  }

  double getInvsSum(List<Transaction> txns) {
    double _sumInvs = 0;
    for (int i = 0; i < txns.length; i++) {
      if (txns[i].type == 'aplicacao') {
        _sumInvs += txns[i].value;
      }
    }
    return _sumInvs;
  }

  double getRedsSum(List<Transaction> txns) {
    double _sumReds = 0;
    for (int i = 0; i < txns.length; i++) {
      if (txns[i].type == 'resgate') {
        _sumReds += txns[i].value;
      }
    }
    return _sumReds;
  }

  double get transactionsBalance {
    double _transactionsBalance =
        getInvsSum(_transactions) - getRedsSum(_transactions);
    return _transactionsBalance;
  }

  Future<void> loadTransactions() async {
    List<Transaction> _loadedTransactions = [];
    final url = Uri.parse(Constants.TXNS_URL);
    final response = await http.get(
      url,
      headers: {"Authorization": _token!},
    );

    final List<dynamic> txnsData;
    final dynamic data = json.decode(response.body);
    if (data != null) {
      txnsData = data['movimentacoes'];
      txnsData.forEach((txnData) {
        _loadedTransactions.add(Transaction(
          type: txnData['tipo'],
          date: txnData['data'],
          value: txnData['valor'],
        ));
      });
    }
    notifyListeners();

    _transactions = _loadedTransactions;
    return Future.value();
  }
}
