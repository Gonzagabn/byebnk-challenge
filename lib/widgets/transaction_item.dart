import 'package:flutter/material.dart';
import 'package:byebnk_app/providers/transactions.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(transaction.value.toString()),
      title: Text(transaction.type),
      subtitle: Text(transaction.date.toString()),
    );
  }
}
