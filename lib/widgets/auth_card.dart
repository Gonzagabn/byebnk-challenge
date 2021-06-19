import 'package:byebnk_app/exceptions/auth_exceptions.dart';
import 'package:byebnk_app/providers/auth.dart';
import 'package:byebnk_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

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

    Auth auth = Provider.of(context, listen: false);

    try {
      await auth.authenticate(_authData['email']!, _authData['password']!);
    } on AuthException catch (error) {
      _showErrorDialog(error.toString());
    } catch (error) {
      _showErrorDialog('Ocorreu um erro inesperado!');
    }

    setState(() {
      _isLoading = false;
    });

    if (auth.isAuth == true) {
      Navigator.of(context).pushNamed(AppRoutes.TXNS_BAL);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final availableHeight = mediaQuery.size.height - mediaQuery.padding.top;
    final availableWidth = mediaQuery.size.width;

    return Column(
      children: [
        SizedBox(
          height: availableHeight * 0.20,
        ),
        Container(
          height: availableHeight * 0.25,
          child: Image.asset('assets/images/logo-1.png'),
        ),
        Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: availableHeight * 0.36,
            width: availableWidth * 0.75,
            padding: EdgeInsets.all(16),
            child: Form(
              key: _form,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Informe um e-mail válido!';
                      }
                      return null;
                    },
                    onSaved: (value) => _authData['email'] = value!,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 4) {
                        return 'Informe uma senha válida!';
                      }
                      return null;
                    },
                    onSaved: (value) => _authData['password'] = value!,
                  ),
                  Spacer(),
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
                      child: Text('ENTRAR'),
                      onPressed: _submit,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
