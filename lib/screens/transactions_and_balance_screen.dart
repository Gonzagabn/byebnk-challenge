import 'package:byebnk_app/utils/app_routes.dart';
import 'package:byebnk_app/widgets/app_drawer.dart';
import 'package:byebnk_app/widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:byebnk_app/providers/transactions.dart';
import 'package:byebnk_app/widgets/transaction_item.dart';

class TransactionsAndBalanceScreen extends StatelessWidget {
  const TransactionsAndBalanceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        AppBar().preferredSize.height;
    final availableWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Movimentações e Saldo'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: availableHeight * 0.2,
            child: Center(child: BalanceCard()),
          ),
          Container(
            color: Colors.black,
            height: availableHeight * 0.05,
            child: Center(
              child: Text(
                'Transações Recentes',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.black,
                  height: availableHeight * 0.75,
                  width: double.infinity,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: availableHeight * 0.75,
                    width: availableWidth * 0.9,
                    child: FutureBuilder(
                      future: Provider.of<Transactions>(context, listen: false)
                          .loadTransactions(),
                      builder: (ctx, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child:
                                CircularProgressIndicator(color: Colors.black),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
