import 'package:flutter/material.dart';

import 'Widgets/CentralTimer.dart';

class Central extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          Expanded(
            child: CentralTimer(
              hours: 00, 
              minutes: 00, 
              seconds: 00, 
              //tickingController: tickingController, 
              days: 00,
            ),
          ),
        ],
      ),
    );
  }



} 