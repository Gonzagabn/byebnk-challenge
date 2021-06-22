import 'package:byebnk_app/providers/auth.dart';
import 'package:byebnk_app/providers/investment.dart';
import 'package:byebnk_app/providers/redemption.dart';
import 'package:byebnk_app/providers/transactions.dart';
import 'package:byebnk_app/screens/authentication_screen.dart';
import 'package:byebnk_app/screens/investments_and_redemptions_screen.dart';
import 'package:byebnk_app/screens/transactions_and_balance_screen.dart';
import 'package:byebnk_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Transactions>(
          create: (_) => new Transactions(null, []),
          update: (ctx, auth, previousTransactions) => new Transactions(
            auth.token,
            previousTransactions!.transactions,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Investments>(
          create: (_) => new Investments(null),
          update: (ctx, auth, previousInvestment) => new Investments(
            auth.token,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Redemptions>(
          create: (_) => new Redemptions(null, null),
          update: (ctx, auth, previousRedemption) => new Redemptions(
            auth.token,
            previousRedemption!.redemption,
          ),
        ),
      ],
      child: MaterialApp(
        title: 'byebnk',
        theme: ThemeData(primaryColor: Colors.black),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.AUTH: (ctx) => AuthenticationScreen(),
          AppRoutes.TXNS_BAL: (ctx) => TransactionsAndBalanceScreen(),
          AppRoutes.INVS_REDS: (ctx) => InvestmentsAndRedemptionsScreen(),
        },
      ),
    );
  }
}

/*
Gestão de Investimentos


consumo de API Rest

3 telas

 - Login
    O login é realizado utilizando o email e senha do usuário. 
    Ao acessar o aplicativo pela primeira vez o usuário deve 
    realizar o login antes de acessar qualquer outra funcionalidade.

 - Movimentações e Saldo
    Esta é a tela inicial do app após o login, nela o usuário pode ver 
    todas as movimentações que foram feitas na sua conta (aplicações e 
    resgate) e também o saldo da sua conta (saldo = aplicações - resgates).
      • A API não retorna o saldo da conta, ele deve ser calculado
        manuamente no app.
      • Deve ser possível o usuário atualizar (no sentido de fazer
        uma nova requisição para o servidor) o seu saldo/movimentações
        sem precisar fechar e abrir o aplicativo.

 - Relizar aplicação ou resgate 
    Nesta tela o usuário pode estipular um valor e fazer uma aplicação ou 
    resgate na sua conta. Aplicação é quando o usuário aporta dinheiro em 
    sua conta. Resgate é quando o usuário retira dinheiro da sua conta.

*/