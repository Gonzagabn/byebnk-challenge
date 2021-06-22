import 'package:byebnk_app/exceptions/http_exceptions.dart';
import 'package:byebnk_app/providers/investment.dart';
import 'package:byebnk_app/providers/redemption.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RedemptionCard extends StatefulWidget {
  const RedemptionCard({Key? key}) : super(key: key);

  @override
  _RedemptionCard createState() => _RedemptionCard();
}

class _RedemptionCard extends State<RedemptionCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  Investment _redData = Investment(date: DateTime.now(), value: 0.00);
  TextEditingController _redTextController = TextEditingController();

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

    Redemptions red = Provider.of(context, listen: false);

    try {
      await red.redemptionRequest(_redData.value);
    } on HttpException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

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
              'Deseja fazer um resgate?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Container(
          height: availableHeight * 0.27,
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
                    'Resgate Agora!',
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
                            controller: _redTextController,
                            decoration: InputDecoration(
                              labelText: 'Informe o valor a ser resgatado...',
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
                              _redData.value = double.parse(value!);
                              _redData.date = DateTime.now();
                              _redTextController.clear();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: availableHeight * 0.02,
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
                          child: Text('RRESGATAR'),
                          onPressed: _submit,
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
