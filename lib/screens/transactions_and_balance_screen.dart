import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:byebnk_app/providers/transactions.dart';
import 'package:byebnk_app/widgets/transaction_item.dart';

class TransactionsAndBalanceScreen extends StatelessWidget {
  const TransactionsAndBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionsData = Provider.of<Transactions>(context);
    final transactions = transactionsData.transactions;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movimentações e Saldo'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              itemCount: transactionsData.transactionsCount,
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  TransactionItem(transactions[index]),
                  Divider(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
