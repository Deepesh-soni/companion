import 'package:flutter/material.dart';

class StatTileNumbers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              Text("110",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize:50.0
                ),
              ),

              Text(" days",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize:25.0
                ),
              ),
            ],
          ),

          Row(
            textBaseline: TextBaseline.alphabetic,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            children: <Widget>[
              Text("10",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize:50.0
                ),
              ),

              Text(" hours",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize:25.0
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

