import 'package:byebnk_app/providers/transactions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestmentCard extends StatefulWidget {
  const InvestmentCard({Key? key}) : super(key: key);

  @override
  _InvestmentCard createState() => _InvestmentCard();
}

class _InvestmentCard extends State<InvestmentCard> {
  GlobalKey<FormState> _form = GlobalKey();
  double? _invData;

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
          height: availableHeight * 0.25,
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
                  'Invista Agora!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Consumer<Transactions>(
                  builder: (ctx, txns, cild) {
                    return Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: availableWidth * 0.7,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Informe o valor a ser aplicado...',
                              ),
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: true),
                              validator: (value) {
                                if (double.parse(value!) == 0.0) {
                                  return 'Informe um valor válido!';
                                }
                                return null;
                              },
                              onSaved: (value) =>
                                  _invData = double.parse(value!),
                            ),
                          ),
                        ],
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
