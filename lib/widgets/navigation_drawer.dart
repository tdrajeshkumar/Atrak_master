import 'package:atrak/localization.dart';
import 'package:atrak/repository/data/beans/employee.dart';
import 'package:atrak/screens/attendance_screen.dart';
import 'package:atrak/screens/comp_off_screen.dart';
import 'package:atrak/screens/holiday_list_screen.dart';
import 'package:atrak/screens/leaves_screen.dart';
import 'package:atrak/screens/manual_punch_screen.dart';
import 'package:atrak/screens/my_approvals_screen.dart';
import 'package:atrak/screens/on_duty_screen.dart';
import 'package:atrak/screens/permissions_screen.dart';
import 'package:atrak/screens/shift_change_screen.dart';
import 'package:atrak/screens/team_attendance_screen.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/utils/url_paths.dart';
import 'package:atrak/widgets/item_navigation_drawer.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  final Stream<Employee> employee;

  NavigationDrawer(this.employee);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Employee>(
        stream: employee,
        builder: (context, empSnapshot) {
          return Drawer(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    AtrakTheme.gradientStartColor,
                    AtrakTheme.gradientEndColor
                  ])),
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          color: Colors.white,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 20.0, bottom: 20.0, left: 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: AtrakTheme.greyTextColor,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  AtrakLocalizations.of(context).logoText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .display3
                                      .copyWith(
                                          color: AtrakTheme.greyTextColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: Theme.of(context)
                                              .textTheme
                                              .headline
                                              .fontSize),
                                ),
                              ],
                            ),
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage(UrlPaths.profileImage),
                                  radius: 40.0,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    empSnapshot.hasData
                                        ? empSnapshot.data.userFullName.substring(0,17)
                                        : "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .display3
                                        .copyWith(
                                            color: AtrakTheme.iconColor,
                                            fontSize: 21.0),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  SizedBox(height: 5.0),
                                  Text(
                                    "Staff Id: ${empSnapshot.hasData ? empSnapshot.data.staffId : ""}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: AtrakTheme.iconColor,
                                        fontSize: 18.0),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.dashboardImage,
                                title: "Dashboard",
                              )),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AttendanceScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.myAttendanceImage,
                                title: "My Attendance"),
                          ),
                          InkWell(
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.holidayImage,
                                title: "Holiday list"),
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HolidayListScreen()));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Container(
                                height: 1.0, color: AtrakTheme.dividerColor),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            child: Text("Request",
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 16,
                                        color: AtrakTheme.greyTextColor)),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeavesScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.leavesImage,
                                title: "Leaves"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ShiftChangeScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.shiftChangeImage,
                                title: "Shift change", width: 30, height: 30,),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PermissionsScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.permissionImage,
                                title: "Permission"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OnDutyScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.onDutyImage,
                                title: "On Duty"),
                          ),
                          ItemNavigationDrawer(
                              imageUrl: UrlPaths.overtimeImage,
                              title: "Over Time"),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CompOffScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.leavesImage,
                                title: "Comp Off Req"),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ManualPunchScreen()));
                            },
                            child: ItemNavigationDrawer(
                                imageUrl: UrlPaths.manualPunchImage,
                                title: "Manual Punch"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25.0, ),
                            child: Container(
                                height: 1.0, color: AtrakTheme.dividerColor),
                          ),
                          empSnapshot.hasData &&
                                  empSnapshot.data.userRole != "User"
                              ? Column(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    TeamAttandanceScreen()));
                                      },
                                      child: ItemNavigationDrawer(
                                          imageUrl: UrlPaths.teamAttendanceImage,
                                          title: "Team Attendance", width: 30.0, height: 30.0,),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MyApprovalsScreen()));
                                      },
                                      child: ItemNavigationDrawer(
                                          imageUrl: UrlPaths.myApprovalsImage,
                                          title: "My Approvals"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10.0),
                                      child: Container(
                                          height: 1.0,
                                          color: AtrakTheme.dividerColor),
                                    ),
                                  ],
                                )
                              : Container(),
                          ListTile(
                              leading: CircleAvatar(),
                              title: Text("My Profile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(fontSize: 16))),
                          ListTile(
                              leading: CircleAvatar(),
                              title: Text("Logout",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display1
                                      .copyWith(fontSize: 16))),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
