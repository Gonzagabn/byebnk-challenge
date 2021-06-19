import 'package:byebnk_app/utils/app_routes.dart';
import 'package:flutter/material.dart';

class AuthCard extends StatefulWidget {
  const AuthCard({Key? key}) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  GlobalKey<FormState> _form = GlobalKey();
  bool _isLoading = false;
  final _passwordController = TextEditingController();

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
            height: availableHeight * 0.35,
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
                    onSaved: (v) {},
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty || value.length < 6) {
                        return 'Informe uma senha válida!';
                      }
                      return null;
                    },
                    onSaved: (v) {},
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
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.TXNS_BAL);
                      },
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
