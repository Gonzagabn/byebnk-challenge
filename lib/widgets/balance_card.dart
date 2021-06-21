import 'package:flutter/material.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({Key? key}) : super(key: key);

  @override
  _BalanceCardState createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        AppBar().preferredSize.height;
    final availableWidth = mediaQuery.size.width;

    return Container(
      height: availableHeight * 0.16,
      width: availableWidth * 0.8,
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: availableHeight * 0.01,
            ),
            Text(
              'SALDO',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: availableHeight * 0.02,
            ),
            Text(
              'R\$ 28.237,00',
              style: TextStyle(
                fontSize: 36,
                color: Colors.green[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
