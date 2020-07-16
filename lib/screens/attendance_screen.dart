import 'package:atrak/theme.dart';
import 'package:atrak/widgets/attendance_list.dart';
import 'package:atrak/widgets/calendar_marker_info.dart';
import 'package:atrak/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "My attendance",
          style: Theme.of(context).textTheme.display1.copyWith(
              fontWeight: FontWeight.w600, color: AtrakTheme.greyTextColor, fontSize: 20.0),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: AtrakTheme.backArrowColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(child: Column(children: <Widget>[
        Padding(
          padding:
          const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
          child: CalendarWidget(),
        ),
        CalendarMarkerInfo(),
        AttendanceList(),
      ],),),
    );
  }
}
