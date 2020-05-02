import 'package:flutter/material.dart';
import 'package:companion/Constants.dart';
import '../NeuPie.dart';
import 'dart:math';

class NeumorphicPie extends StatelessWidget {
  
  const NeumorphicPie({ @required this.radius, this.child});

  final double radius;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius*2,
      height: radius*2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF18191E),
        boxShadow:[
          BoxShadow(
            color: kShadowColor,
            offset:Offset(-9,-9),
            //spreadRadius: 4.0,
            blurRadius: 15.0, 
          ),

          BoxShadow(
            color: Color(0xFF040507),
            offset:Offset(10.5,10.5),
            //spreadRadius: 4.0,
            blurRadius: 15.0,
          ),
        ]
      ),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(35.0),      
              child: Container(
              child: Stack(
                children: <Widget>[

                  Transform.rotate(
                    angle: pi * 1.6,
                    child: CustomPaint(
                      child: Center(),
                      painter: ProgressRings(
                        completedPercentage: 0.65,
                        circleWidth: 50.0,
                        gradient: greenGradient,
                        gradientStartAngle: 0.0,  
                        gradientEndAngle: pi / 3,
                        progressStartAngle: 1.85,
                        lengthToRemove: 3,
                      ),
                    ),
                  ),

                  Transform.rotate(
                    angle: pi / 1.8,
                    child: CustomPaint(
                      child: Center(),
                      painter: ProgressRings(
                        completedPercentage: 0.20,
                        circleWidth: 50.0,  
                        gradient: turqoiseGradient,
                      ),
                    ),
                  ),

                  Transform.rotate(
                    angle: pi / 2.6,
                    child: CustomPaint(
                      child: Center(),
                      painter: ProgressRings(
                        completedPercentage: 0.35,
                        circleWidth: 50.0,
                        gradient: redGradient,
                        gradientStartAngle: 0.0,     
                        gradientEndAngle: pi / 2,
                        progressStartAngle: 1.85,
                      ),
                    ),
                  ),

                  Transform.rotate(
                    angle: pi * 1.1,
                    child: CustomPaint(
                      child: Center(),
                      painter: ProgressRings(
                        completedPercentage: 0.24,
                        circleWidth: 50.0,
                        gradient: orangeGradient,
                        gradientStartAngle: 0.0,
                        gradientEndAngle: pi / 2,
                        progressStartAngle: 1.85,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          Center(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(           
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
                  boxShadow:[   
                    BoxShadow(
                      color: kShadowColor,
                      offset:Offset(10.5,10.5),
                      spreadRadius: 1.0,
                      blurRadius: 10.0,
                    ),
                    BoxShadow(
                      color: Color(0xFF040507),
                      offset:Offset(-5,-5),
                      spreadRadius: 1.0,
                      blurRadius: 15.0,
                    ),      
                  ]
                )
              ),
            ),
          ],
        ),
      );
    } 
  }

const greenGradient = [
  Color(0xFF205072),
  Color(0xFF205072),
  
];
const turqoiseGradient = [
  Color(0xFF6D9197),
  Color(0xFF6D9197),
];

const redGradient = [
  Color(0xFFF34427),
  Color(0xFFF34427),
  
];
const orangeGradient = [
  Colors.deepPurpleAccent,
  Colors.deepPurpleAccent,
];