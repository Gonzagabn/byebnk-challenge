import 'package:flutter/material.dart';

class InvestmentsAndRedemptionsScreen extends StatelessWidget {
  const InvestmentsAndRedemptionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height - mediaQuery.padding.top;
    final availableWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicações e Resgates'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(height: availableHeight * 10),
              Card(
                elevation: 5,
                child: Container(
                  height: availableHeight * 25,
                  width: availableWidth * 80,
                  child: Text('data'),
                ),
              ),
              SizedBox(height: availableHeight * 10),
              Card(
                elevation: 5,
                child: Container(
                  height: availableHeight * 25,
                  width: availableWidth * 80,
                  child: Text('data'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
