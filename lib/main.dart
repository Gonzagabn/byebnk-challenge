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
          create: (_) => new Redemptions(null),
          update: (ctx, auth, previousRedemption) => new Redemptions(
            auth.token,
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
