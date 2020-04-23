import 'package:flutter/material.dart';
import 'TickerPage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Constants.dart';


void main(){
  initializeDateFormatting().then((_) => runApp(Companion()));
}

class Companion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF333739),
        scaffoldBackgroundColor: Color(0xFF333739),
        backgroundColor: Color(0xFFF9F3F0),
        buttonColor:kButtonColor,
      ),
      home: TickerPage(),
    );
  }
}  