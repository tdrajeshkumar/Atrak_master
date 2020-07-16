import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_attendance_list.dart';
import 'package:flutter/material.dart';

class AttendanceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AtrakTheme.attendanceBackgroundColor,
        alignment: Alignment(-1.0, 0.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            Text(
              'In - out time summary',
              style: Theme.of(context).textTheme.display1.copyWith(
                  color: AtrakTheme.darkDisplayColor,
                  fontWeight: FontWeight.w600,
                  fontSize: Theme.of(context).textTheme.headline.fontSize),
            ),
            SizedBox(
              height: 10.0,
            ),
            ItemAttendanceList(),
          ],
        ),
      ),
    );
    ;
  }
}
