import 'package:byebnk_app/providers/auth.dart';
import 'package:byebnk_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Bem-vindo Investidor!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Movimentações e Saldo'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.TXNS_BAL,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.auto_graph_sharp),
            title: Text('Aplicações e Resgates'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                AppRoutes.INVS_REDS,
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              Provider.of<Auth>(context, listen: false).logout();
              Navigator.of(context).pushReplacementNamed(AppRoutes.AUTH);
            },
          ),
        ],
      ),
    );
  }
}
