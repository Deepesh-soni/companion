import 'package:flutter/material.dart';
import 'NeumorphicCard.dart';

class StatTile extends StatelessWidget {
  const StatTile({
    @required this.padding,@required this.height,this.width,this.child
  });

  final double width;
  final double height;
  final double padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: NeumorphicCard(height: height, width: width,child: child,),
    );
  }
}