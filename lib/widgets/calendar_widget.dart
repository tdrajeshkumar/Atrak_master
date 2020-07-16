import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

const leaveColor = Color(0xFFF15A24);
const holidayColor = Color(0xFF00DF93);
const List list = [
  {
    "Date": "2018-11-5T14:41:03.094Z",
    "Shift": "Shift A",
    "InTime": "2018-10-25T14:41:03.094Z",
    "OutTime": "2018-10-25T14:41:03.094Z",
    "WorkedHrs": 10,
    "Status": "Present",
    "ColorCode": "#4286f4",
    "IsWeekOff": "false"
  },
  {
    "Date": "2018-11-28T14:41:03.094Z",
    "Shift": "Shift A",
    "InTime": "2018-10-25T14:41:03.094Z",
    "OutTime": "2018-10-25T14:41:03.094Z",
    "WorkedHrs": 0,
    "ColorCode": "#f47441",
    "Status": "Leave",
    "IsWeekOff": "false"
  },
  {
    "Date": "2018-11-25T14:41:03.094Z",
    "Shift": "Shift A",
    "InTime": "2018-10-25T14:41:03.094Z",
    "OutTime": "2018-10-25T14:41:03.094Z",
    "WorkedHrs": 0,
    "Status": "Festival",
    "ColorCode": "#f441be",
    "IsWeekOff": "false"
  }
];

class CalendarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CalendarState();
}

class CalendarState extends State<CalendarWidget> {
  Widget _getMarker(DateTime day) {
//    print('inside');
    for (Map data in list) {
      var date = data['Date'].toString();
//      print(data['ColorCode'].toString().replaceFirst(new RegExp(r'#'), '0xFF'));
      if (date.substring(0, 10).contains('T')) {
        if (int.parse(date.substring(0, 4)) == day.year &&
            int.parse(date.substring(5, 7)) == day.month &&
            int.parse(date.substring(8, 9)) == day.day) {
          return Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(int.parse(data['ColorCode']
                    .toString()
                    .replaceFirst(new RegExp(r'#'), '0xFF')))),
          );
        }
      } else {
        if (int.parse(date.substring(0, 4)) == day.year &&
            int.parse(date.substring(5, 7)) == day.month &&
            int.parse(date.substring(8, 10)) == day.day) {
          return Container(
            width: 10.0,
            height: 10.0,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(int.parse(data['ColorCode']
                    .toString()
                    .replaceFirst(new RegExp(r'#'), '0xFF')))),
          );
        }
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Calendar(
      showTodayAction: false,
      onDateSelected: (DateTime day){
        print(day);
      },
      dayBuilder: (BuildContext context, DateTime day) {
        return Container(
          // adding decoration if its today
          decoration: _getDecoration(context, day),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${day.day.toString()}',
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 3.0,
              ),
              _getMarker(day)
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _getDecoration(BuildContext context, DateTime day) {
    if (day.day == DateTime.now().day &&
        day.year == DateTime.now().year &&
        day.month == DateTime.now().month) {
      return BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF2A4BFF),
            Color(0xFF36D0DD),
          ],
          begin: Alignment(1.0, -1.0),
        ),
      );
    }
    return BoxDecoration();
  }
}
