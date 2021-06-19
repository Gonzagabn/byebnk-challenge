import 'package:flutter/material.dart';

class TransactionsAndBalanceScreen extends StatelessWidget {
  const TransactionsAndBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movimentações e Saldo'),
      ),
      body: Center(
        child: Container(
          height: 400,
          width: 400,
        ),
      ),
    );
  }
}
