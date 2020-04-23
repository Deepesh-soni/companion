import 'package:companion/Constants.dart';
import 'package:companion/Widgets/Custom_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';
import 'widgets/Custom_bottom_sheet.dart';


class TickerPage extends StatefulWidget{

  @override
  _TickerPageState createState() => _TickerPageState();
}

class _TickerPageState extends State<TickerPage> with SingleTickerProviderStateMixin {

  AnimationController tickingController;

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
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: CircleAvatar(
                backgroundColor: Color(0xFFFE5029),
                radius: 120.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      (tickingController.value~/(60*60)).toString().padLeft(2,'0'),
                      style: kTickerTextStyle,
                    ),

                    SizedBox( child: Text(":",style: kTickerTextStyle,),),

                    Text(
                      (tickingController.value~/60).toString().padLeft(2,'0'),
                      style: kTickerTextStyle,
                    ),

                    SizedBox(child: Text(":",style: kTickerTextStyle,),),

                    Text(
                      (tickingController.value%60).toInt().toString().padLeft(2,'0'),
                      style: kTickerTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),

          IconButton(
            onPressed: (){
              tickingController.reset();
              tickingController.forward();
              print(DateTime.now());
            },
            color: kButtonColor, 
            icon: Icon(Icons.thumb_down),
            iconSize: 40.0,
            
          ),

          BottomButton()
        ],
      ),
    );
  }
}

