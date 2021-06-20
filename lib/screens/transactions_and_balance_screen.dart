import 'package:byebnk_app/utils/app_routes.dart';
import 'package:byebnk_app/widgets/app_drawer.dart';
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
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<Transactions>(context, listen: false)
            .loadTransactions(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          } else if (snapshot.hasError) {
            return AlertDialog(
              title: Text('Ocorreu um erro!'),
              content: Text('Ocorreu um erro FAKE!'),
              actions: <Widget>[
                TextButton(
                  child: Text('Fechar'),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(AppRoutes.TXNS_BAL);
                  },
                )
              ],
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
