import 'package:flutter/material.dart';

class InvestmentsAndRedemptionsScreen extends StatelessWidget {
  const InvestmentsAndRedemptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicações e Resgates'),
      ),
      body: Column(
        children: <Widget>[
          Card(),
          Card(),
        ],
      ),
    );
  }
}
