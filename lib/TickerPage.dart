import 'dart:convert';
import 'package:companion/Constants.dart';
import 'package:companion/Widgets/NeumorphicCard.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'widgets/CentralTimer.dart';
import 'package:line_icons/line_icons.dart';



class TickerPage extends StatefulWidget{

  @override
  _TickerPageState createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> with SingleTickerProviderStateMixin {

  AnimationController tickingController;
  int hours=0;
  int minutes=0;
  int seconds=0;
  int days=0;
  DateTime _dateTime;
  SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    tickingController=AnimationController(
      lowerBound: 0,
      upperBound: 3600,
      duration: Duration(minutes: 60),
      vsync: this,
    );

    tickingController.forward();

    tickingController.addListener((){
      setState(() { });
    });

    initPref();  
  }

  dynamic myEncode(dynamic item) {
    if(item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }

  initPref() async {
    pref = await SharedPreferences.getInstance();

    setState(() {
      _dateTime=DateTime.parse(json.decode(pref.getString("LastHit"))); 

      print(_dateTime);
      if(_dateTime != null)
      {
       var berlinWallFell = _dateTime;
        var dDay = new DateTime.now();
        Duration difference = dDay.difference(berlinWallFell);
        //assert(difference.inDays == 16592);
        print(difference);
        seconds=difference.inSeconds%60;
        minutes=difference.inMinutes%60;
        hours=difference.inHours%24;
        days=difference.inHours~/24;
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Companion"),
        elevation: 10.0, 
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          Expanded(
            flex:1,
            child: Row(
              children: <Widget>[

                Expanded(child: Container(),flex: 2,),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(18.0, 0.0, 5.0, 0.0),
                      child: GestureDetector(
                        child: NeumorphicCard(height: 50.0, width: 60.0,child: Icon(LineIcons.line_chart)),
                        onTap: (){
                          Navigator.pushNamed(context, '/StatsPage');
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex:4,
            child: CentralTimer(
              hours: hours, 
              minutes: minutes, 
              seconds: seconds, 
              tickingController: tickingController, 
              days: days,
            ),
          ),

          Expanded(
            flex:2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: NeumorphicCard(
                    height: 60.0, 
                    width: 150.0,
                    borderRadius: 25.0,
                    border: Border.all(
                      color:Colors.white30,
                      width:2.0,
                    ),
                    backgroundImage:DecorationImage(
                      image: AssetImage("Images/thumbs_down2.gif"),
                      alignment: Alignment.bottomRight,
                      fit: BoxFit.contain
                    ),
                  ),
                  onTap: (){
                    tickingController.reset();
                    tickingController.forward();
                    print(DateTime.now());
                    pref.setString("LastHit", json.encode(DateTime.now(),toEncodable: myEncode));
                    initPref();
                  },
                ),

                GestureDetector(
                  child: NeumorphicCard(
                    backgroundImage:DecorationImage(
                      image: AssetImage("Images/Nature4.gif"),
                      fit: BoxFit.cover
                    ),
                    height: 60.0, 
                    width: 150.0,
                    borderRadius: 25.0,
                    border: Border.all(
                      color:Colors.white30,
                      width:2.0,
                    ),
                  ),
                  onTap: (){},
                ),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: (){
          //     tickingController.reset();
          //     tickingController.forward();
          //     print(DateTime.now());
          //     pref.setString("LastHit", json.encode(DateTime.now(),toEncodable: myEncode));
          //     initPref();
          //   },
          // ),
          Expanded(flex:1,child: Container()),
          BottomButton()
        ],
      ),
    );
  }
}

