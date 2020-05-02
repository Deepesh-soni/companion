import 'package:flutter/material.dart';
import 'package:companion/Constants.dart';

class NeumorphicCard extends StatelessWidget {
  
  const NeumorphicCard({ 
    @required this.height, 
    this.width, 
    this.child, 
    this.borderRadius=8.0, 
    this.border, 
    this.backgroundImage
  });

  final double width;
  final double height;
  final double borderRadius;
  final Widget child;
  final BoxBorder border;
  final DecorationImage backgroundImage;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: backgroundImage,
          //     borderRadius: BorderRadius.circular(30.0),
          //     border: Border.all(
          //       color: Theme.of(context).primaryColor,
          //       width:4.0
          //     ),
        shape: BoxShape.rectangle,
        color: Color(0xFF18191E),
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        boxShadow:[
          BoxShadow(
            color: kShadowColor,
            offset:Offset(-2,-2),
            spreadRadius: 2.0,
            blurRadius: 10.0,
          ),

          BoxShadow(
            color: Color(0xFF040507),
            offset:Offset(1.5,1.5),
            spreadRadius: 2.0,
            blurRadius: 8.0,
          ),
        ]
      ),
      child:child,
    );
  }
}

