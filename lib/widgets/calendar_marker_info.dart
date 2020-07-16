import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class CalendarMarkerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 60.0),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: AtrakTheme.leaveColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: AtrakTheme.leaveColor,
            ),
            width: 10.0,
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              'Leave',
              style: TextStyle(
                fontSize: Theme.of(context).textTheme.subhead.fontSize,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w400,
                color: Color(0xFFB3B3B3),
              ),
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: AtrakTheme.holidayColor),
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: AtrakTheme.holidayColor,
            ),
            width: 10.0,
            height: 10.0,
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
      ),
    );
  }
}
