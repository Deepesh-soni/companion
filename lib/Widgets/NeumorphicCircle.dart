import 'package:flutter/material.dart';
import 'package:companion/Constants.dart';

class NeumorphicCircle extends StatelessWidget {
  
  const NeumorphicCircle({ @required this.radius, this.child});

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
              offset:Offset(-2,-2),
              spreadRadius: 4.0,
              blurRadius: 10.0,

            ),

            BoxShadow(
              color: Color(0xFF040507),
              offset:Offset(1.5,1.5),
              spreadRadius: 4.0,
              blurRadius: 30.0,
            ),
        ]
      ),
      child:child,
    );
  }
}

