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

  Future<void> _authenticate(
      String email, String password, String authMethod) async {
    final url = Uri.parse(authMethod);

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

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, Constants.AUTH_URL);
  }

  void logout() {
    _token = null;

    Store.remove('userData');

    notifyListeners();
  }
}
