import 'package:flutter/material.dart';
import 'Widgets/Custom_bottom_sheet.dart';

class BottomButton extends StatelessWidget {

  final BoxDecoration bottomSheetDecoration= BoxDecoration(
    color: Color(0xFFF9F3F0),
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.vertical(top:Radius.elliptical(30, 22))
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showModalBottomSheet(
          context: context,
          builder: (context) => CustomBottomSheet(bottomSheetDecoration: bottomSheetDecoration), 
        );
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Container(
          width: double.infinity,
          height: 70.0,
          child: Icon(
            Icons.calendar_today,
            color: Color(0xFF333739),
            size: 30.0,
          ),
          decoration: bottomSheetDecoration,
        ),
      ),
    );
  }
}

