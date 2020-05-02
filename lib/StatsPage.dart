import 'package:companion/Constants.dart';
import 'package:companion/Widgets/NeumorphicCircle.dart';
import 'package:flutter/material.dart';
import 'widgets/StatTile.dart';
import 'StatTileNumbers.dart';
import 'widgets/NeumorphicPie.dart';

class StatsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Table(
            children: [
  
              TableRow(
                children:<Widget>[
                  StatTile(
                    padding: 10.0,
                    height: 30, 
                    width: 80,
                    child: Center(child: Text("Longest Streak")),
                  ),

                  StatTile(
                    padding: 10.0,
                    height: 30, 
                    width: 80,
                    child: Center(child: Text("Shortest Streak")),
                  ),
                ]                          
              ),

              TableRow(
                children:<Widget>[
                  StatTile(
                    padding: 10.0,
                    height: 120, 
                    width: 80,
                    child: StatTileNumbers(),
                  ),

                  StatTile(
                    padding: 10.0,
                    height: 120, 
                    width: 80,
                    child: StatTileNumbers(),
                  ),  
                ]                          
              ),

              TableRow(
                children:<Widget>[
                  StatTile(
                    padding: 10.0,
                    height: 30, 
                    width: 80,
                    child: Center(child: Text("Total Relapce")),
                  ),

                  StatTile(
                    padding: 10.0,
                    height: 30, 
                    width: 80,
                    child: Center(child: Text("Average Streak")),
                  ),
                ]                          
              ),

              TableRow(
                children:<Widget>[
                  StatTile(
                    padding: 10.0,
                    height: 120, 
                    width: 80,
                    child: Center(
                      child: Text("10",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:50.0
                        ),
                      ),
                    ),  
                  ),

                  StatTile(
                    padding: 10.0,
                    height: 120, 
                    width: 80,
                    //child: StatTileNumbers(),
                    child: Center(
                      child: Text("10.44",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:50.0
                        ),
                      ),
                    ),
                  ),  
                ]                          
              ),
            ]
          ),

          SizedBox(height: 50.0),
          
          NeumorphicPie(
            radius: 120.0,
          ),
        ]
      )
    );
  }
}

