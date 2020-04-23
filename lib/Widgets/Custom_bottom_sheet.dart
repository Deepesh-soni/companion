import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:companion/Constants.dart';



class CustomBottomSheet extends StatefulWidget {

  CustomBottomSheet({ @required this.bottomSheetDecoration});

  final BoxDecoration bottomSheetDecoration;

  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {

  CalendarController _calendarController;
  TextEditingController _eventController;
  Map<DateTime,List<dynamic>> _events;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _eventController=TextEditingController(text: DateTime.now().toString());
    _events={}; 
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
              Icons.line_weight,
              color: Colors.black,
            ),

            SizedBox(height:20.0),

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
                    (DateTime.now());   
                  }else{
                    _events[_calendarController.selectedDay]=
                    [DateTime.now()];
                  }
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