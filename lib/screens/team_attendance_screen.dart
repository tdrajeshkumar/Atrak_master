import 'package:atrak/screens/team_daily_attendance_screen.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_team_attendance_summary_card.dart';
import 'package:flutter/material.dart';

class TeamAttandanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            "Team Attendance",
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
              size: 30.0,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Container(
        color: Color(0xFFEEF0F2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 35.0,
                  ),
                  Text(
                    "09:42",
                    style: Theme.of(context).textTheme.display2.copyWith(
                          color: AtrakTheme.darkDisplayColor,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Work Sans',
                        ),
                  ),
                  Text(
                    "Monday 14, Nov 2018",
                    style: Theme.of(context).textTheme.headline.copyWith(
                          color: AtrakTheme.darkDisplayColor,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Work Sans',
                        ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 15.0, right: 15.0),
                    child: Text(
                      "Today's summary",
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: Color(0xFF4D4D4D)),
                    ),
                  ),
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: <Widget>[
                      ItemTeamAttendanceSummaryCard(
                        title: 'Total present',
                        bigText: '10',
                        subText: '/10',
                        isTime: false,
                      ),
                      ItemTeamAttendanceSummaryCard(
                        title: 'Total absent',
                        bigText: '09:00',
                        subText: 'AM',
                        isTime: true,
                      ),
                      ItemTeamAttendanceSummaryCard(
                        title: 'Avg. Late coming time',
                        bigText: '10',
                        subText: '/10',
                        isTime: false,
                      ),
                      ItemTeamAttendanceSummaryCard(
                        title: 'Avg. Late coming time',
                        bigText: '09:00',
                        subText: 'AM',
                        isTime: true,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TeamDailyAttendanceScreen()));
                    },
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(7.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    AtrakTheme.gradientStartColor,
                                    AtrakTheme.gradientEndColor,
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.calendar_today,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Daily attendance',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(color: AtrakTheme.darkDisplayColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
