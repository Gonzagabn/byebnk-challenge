import 'package:byebnk_app/widgets/app_drawer.dart';
import 'package:byebnk_app/widgets/investment_card.dart';
import 'package:byebnk_app/widgets/redemption_card.dart';
import 'package:flutter/material.dart';

class InvestmentsAndRedemptionsScreen extends StatelessWidget {
  const InvestmentsAndRedemptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        AppBar().preferredSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicações e Resgates'),
      ),
      drawer: AppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          height: availableHeight,
          width: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InvestmentCard(),
              RedemptionCard(),
            ],
          ),
        ),
      ),
    );
  }
}
//colocar snackbar anunciando o sucesso da transação