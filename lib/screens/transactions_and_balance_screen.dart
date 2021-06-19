import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:byebnk_app/providers/transactions.dart';
import 'package:byebnk_app/widgets/transaction_item.dart';

class TransactionsAndBalanceScreen extends StatelessWidget {
  const TransactionsAndBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movimentações e Saldo'),
      ),
      body: FutureBuilder(
        future: Provider.of<Transactions>(context, listen: false)
            .loadTransactions(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else {
            return Consumer<Transactions>(
              builder: (ctx, txns, cild) {
                return ListView.builder(
                  itemCount: txns.transactionsCount,
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      TransactionItem(txns.transactions[index]),
                      Divider(),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
