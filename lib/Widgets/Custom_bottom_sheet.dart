import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:companion/Constants.dart';
import 'dart:convert';


class CustomBottomSheet extends StatefulWidget {

  CustomBottomSheet({ @required this.bottomSheetDecoration});

  final BoxDecoration bottomSheetDecoration;

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  CalendarController _calendarController;
  TextEditingController _eventController;
  SharedPreferences prefs;

  Map<DateTime,List<dynamic>> _events;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _eventController=TextEditingController(text: DateTime.now().toString());
    _events={};
    initprefs();
  }

  initprefs() async {
    prefs = await SharedPreferences.getInstance();

    setState(() {
    _events=Map<DateTime,List<dynamic>>.from(decodeMap(json.decode(prefs.getString("events") ?? "{}")));  
    });
    
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  Map<String,dynamic> encodeMap(Map<DateTime,dynamic> map){
    Map<String,dynamic> newMap = {};
    map.forEach((key,value){
      newMap[key.toString()]=map[key];
    });
    return newMap;
  }

  Map<DateTime,dynamic> decodeMap(Map<String,dynamic> map){
    Map<DateTime,dynamic> newMap = {};
    map.forEach((key,value){
      newMap[DateTime.parse(key)]=map[key];
    });
    return newMap;
  }
    
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Container(
        decoration: widget.bottomSheetDecoration,
        child: ListView(
          children: <Widget>[
            Icon(
              Icons.remove,
              color: Colors.black,
              size: 45.0,
            ),

            Container(
              child: TableCalendar(
                events: _events,
                headerStyle: HeaderStyle(
                  titleTextStyle: kCalendarHeaderTextStyle,
                  formatButtonTextStyle:kCalendarHeaderTextStyle,
                ),

                calendarStyle: CalendarStyle(
                  weekdayStyle: TextStyle(color: Colors.black87)
                ),
                calendarController: _calendarController,
                builders: CalendarBuilders(
                  
                ),
              ),
            ),

            Center(
              child: RaisedButton(
                elevation: 10.0,
                child: Text("Add event"),
                onPressed: _showAddDialog,
              ),
            ),

            SizedBox(height:200.0),
          ],
        ),
      ),
    );
  }

  _showAddDialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _eventController,
        ),        
      actions: <Widget>[
        RaisedButton(
          child: Text("Add"),
          onPressed: (){
            if(_eventController.text.isEmpty) return;
            setState(() {
              if(_events[_calendarController.selectedDay]!=null){
                _events[_calendarController.selectedDay].add
                (_eventController.text);   
              }else{
                _events[_calendarController.selectedDay]=
                [_eventController.text];
              }
              prefs.setString("events", json.encode(encodeMap(_events)));
              _eventController.clear();
              Navigator.pop(context);
            });
          }
        )
      ],
    )
  );
}
}