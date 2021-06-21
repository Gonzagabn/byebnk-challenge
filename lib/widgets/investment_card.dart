import 'package:byebnk_app/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestmentCard extends StatefulWidget {
  const InvestmentCard({Key? key}) : super(key: key);

  @override
  _InvestmentCard createState() => _InvestmentCard();
}

class _InvestmentCard extends State<InvestmentCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        AppBar().preferredSize.height;
    final availableWidth = mediaQuery.size.width;

    return Column(
      children: <Widget>[
        Container(
          height: availableHeight * 0.05,
          child: Center(
            child: Text(
              'Deseja fazer uma aplicação?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: availableHeight * 0.3,
          width: availableWidth * 0.9,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'SALDO',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Consumer<Transactions>(
                  builder: (ctx, txns, cild) {
                    return Text(
                      'R\$ ${txns.transactionsBalance}',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.green[600],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
