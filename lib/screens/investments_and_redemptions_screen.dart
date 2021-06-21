import 'package:byebnk_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class InvestmentsAndRedemptionsScreen extends StatelessWidget {
  const InvestmentsAndRedemptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height -
        mediaQuery.padding.top -
        AppBar().preferredSize.height;
    final availableWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicações e Resgates'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Container(),
          Container(),
        ],
      ),
    );
  }
}
