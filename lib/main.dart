import 'package:flutter/material.dart';
import 'TickerPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Constants.dart';
import 'StatsPage.dart';
import 'Central.dart';


void main(){
  initializeDateFormatting().then((_) => runApp(Companion()));
}

class Companion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor:kPrimaryColor,
        backgroundColor: Color(0xFFF9F3F0),
        buttonColor:kButtonColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TickerPage(),
        '/StatsPage': (context) => StatsPage(),
        '/CentralPage': (context) => Central(),

      },
    );
  }
}  