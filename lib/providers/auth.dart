import 'dart:async';
import 'dart:convert';

import 'package:byebnk_app/data/store.dart';
import 'package:byebnk_app/exceptions/auth_exceptions.dart';
import 'package:byebnk_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _token;

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    } else {
      return null;
    }
  }

  Future<void> authenticate(String email, String password) async {
    final url = Uri.parse(Constants.AUTH_URL);

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        'username': email,
        'password': password,
      }),
    );

    final responseBody = json.decode(response.body);
    if (responseBody['errors'] != null) {
      throw AuthException(responseBody['errors']);
    } else {
      _token = responseBody['token'];

      Store.saveMap('userData', {
        'token': _token,
      });

      notifyListeners();
    }

    return Future.value();
  }

  void logout() {
    _token = null;

    Store.remove('userData');

    notifyListeners();
  }
}
