import 'package:flutter/material.dart';
import 'NeumorphicCircle.dart';
import 'package:companion/Constants.dart';

class CentralTimer extends StatelessWidget {
  const CentralTimer({
    Key key,
    @required this.hours,
    @required this.minutes,
    @required this.seconds,
    //@required Should be turned on
    this.tickingController,
    @required this.days,
  }) : super(key: key);

  final int hours;
  final int minutes;
  final int seconds;
  final AnimationController tickingController;
  final int days;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: NeumorphicCircle(
            radius: kNeumorphicCircleRadius,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  (hours+(minutes+(seconds+tickingController.value))~/(60*60)).toString().padLeft(2,'0')+":",
                  style: kTickerTextStyle,
                ),

                Text(
                  (minutes+(seconds+tickingController.value)~/60).toString().padLeft(2,'0')+":",
                  style: kTickerTextStyle,
                ),

                Text(
                  ((seconds+tickingController.value)%60).toInt().toString().padLeft(2,'0'),
                  style: kTickerTextStyle,
                ),
              ],
            ),
          ),
        ),

        Positioned(
          //bottom: 190.0,
          child: Center(
            child: Column(
              children: <Widget>[
                Text(days.toString(),style: kTickerDayNumberStyle),
                Text("days",style: kTickerDayTextStyle),   
              ],
            ),
          ),
        )

        // Center(
        //   child: SizedBox(
        //     height: 350.0,
        //     child: Column(
        //       children: <Widget>[
        //         Text(days.toString(),style: kTickerDayNumberStyle),
        //         Text("days",style: kTickerDayTextStyle),
        //       ],
        //     )
        //   )
        //),
      ] 
    );
  }
}

