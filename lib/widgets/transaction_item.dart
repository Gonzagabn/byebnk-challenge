import 'package:flutter/material.dart';
import 'package:byebnk_app/providers/transactions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;

  TransactionItem(this.transaction);

  String _firstInCaps(String string) {
    return '${string[0].toUpperCase()}${string.substring(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        DateFormat('d MMM yy').format(transaction.date),
        style: TextStyle(
          color: Colors.grey[500],
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      title: Text(
        'R\$ ${transaction.value.toStringAsFixed(2)}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      trailing: Text(
        _firstInCaps(transaction.type),
        style: TextStyle(
          color: transaction.type == 'aplicacao'
              ? Colors.green[600]
              : Colors.red[900],
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
