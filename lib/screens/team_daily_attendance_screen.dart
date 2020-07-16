import 'package:atrak/theme.dart';
import 'package:atrak/widgets/calendar_widget.dart';
import 'package:atrak/widgets/item_team_daily_attendance.dart';
import 'package:flutter/material.dart';

class TeamDailyAttendanceScreen extends StatefulWidget {
  @override
  _TeamDailyAttendanceScreenState createState() => _TeamDailyAttendanceScreenState();
}

class _TeamDailyAttendanceScreenState extends State<TeamDailyAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Daily attendance",
          style: Theme.of(context).textTheme.display1.copyWith(
              fontWeight: FontWeight.w600,
              color: AtrakTheme.greyTextColor,
              fontSize: 20.0),
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
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
              child: CalendarWidget(),
            ),
            leaveInfoWidget(context),
            Expanded(
              child: Container(
                color: AtrakTheme.backgroundColor,
                child: ListView(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 20.0,
                      bottom: 5.0,
                    ),
                    child: Text(
                      'In - out time summary',
                      style: Theme.of(context).textTheme.title.copyWith(
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w600,
                            color: AtrakTheme.darkDisplayColor,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '14 Nov 2018',
                      style: TextStyle(color: AtrakTheme.darkDisplayColor),
                    ),
                  ),
                  ItemTeamDailyAttendance(
                    name: 'Sujatha',
                    designation: 'Jr.engineer',
                    inTime: '09: 00 AM',
                    outTime: '06: 00 PM',
                    imageUrl:
                        'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg',
                  ),
                  ItemTeamDailyAttendance(
                    name: 'Venkat Raj',
                    designation: 'Jr.engineer',
                    inTime: '09: 00 AM',
                    outTime: '06: 00 PM',
                    imageUrl:
                        'https://content-static.upwork.com/uploads/2014/10/01073427/profilephoto1.jpg',
                  ),
                ]),
              ),
            )
            // AttendanceList(),
          ],
        ),
      ),
    );
  }

  Widget leaveInfoWidget(context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: holidayColor),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            color: holidayColor,
          ),
          width: 8.0,
          height: 8.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            'Holiday',
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.subhead.fontSize,
              fontFamily: 'Work Sans',
              fontWeight: FontWeight.w400,
              color: Color(0xFFB3B3B3),
            ),
          ),
        )
      ],
    );
  }
}
