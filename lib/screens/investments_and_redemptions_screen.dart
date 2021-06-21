import 'package:byebnk_app/widgets/app_drawer.dart';
import 'package:byebnk_app/widgets/investment_card.dart';
import 'package:flutter/material.dart';

class InvestmentsAndRedemptionsScreen extends StatelessWidget {
  const InvestmentsAndRedemptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicações e Resgates'),
      ),
      drawer: AppDrawer(),
      body: Container(
        width: double.infinity,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            InvestmentCard(),
            InvestmentCard(),
          ],
        ),
      ),
    );
  }
}
//colocar snackbar anunciando o sucesso da transação