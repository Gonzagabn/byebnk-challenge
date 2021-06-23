import 'package:byebnk_app/exceptions/http_exceptions.dart';
import 'package:byebnk_app/providers/investment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvestmentCard extends StatefulWidget {
  const InvestmentCard({Key? key}) : super(key: key);

  @override
  _InvestmentCard createState() => _InvestmentCard();
}

class _InvestmentCard extends State<InvestmentCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  Investment _invData = Investment(date: DateTime.now(), value: 0.00);
  TextEditingController _invTextController = TextEditingController();

  void _showErrorDialog(String msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ocorreu um erro!'),
        content: Text(msg),
        actions: <Widget>[
          TextButton(
            child: Text('Fechar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState!.save();

    Investments inv = Provider.of(context, listen: false);

    try {
      await inv.investmentRequest(_invData.value);
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Aplicação realizada com sucesso!',
          style: TextStyle(
            color: Colors.lightGreenAccent[400],
          ),
        ),
        duration: Duration(milliseconds: 2500),
      ),
    );

    setState(() {
      _isLoading = false;
    });
  }

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
          height: availableHeight * 0.30,
          width: availableWidth * 0.9,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: availableWidth * 0.04, top: availableHeight * 0.02),
                  child: Text(
                    'Invista Agora!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Form(
                  key: _form,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Center(
                        child: Container(
                          width: availableWidth * 0.7,
                          child: TextFormField(
                            controller: _invTextController,
                            decoration: InputDecoration(
                              labelText: 'Informe o valor a ser aplicado...',
                            ),
                            keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  double.parse(value) == 0.0) {
                                return 'Informe um valor válido!';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _invData.value = double.parse(value!);
                              _invData.date = DateTime.now();
                              _invTextController.clear();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: availableHeight * 0.03,
                      ),
                      if (_isLoading)
                        CircularProgressIndicator(
                          color: Colors.black,
                        )
                      else
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 8.0,
                              ),
                            ),
                          ),
                          child: Text(
                            'APLICAR',
                            style: TextStyle(
                              color: Colors.lightGreenAccent[400],
                            ),
                          ),
                          onPressed: _submit,
                        ),
                      SizedBox(
                        height: availableHeight * 0.02,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
