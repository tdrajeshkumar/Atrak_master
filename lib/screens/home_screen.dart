import 'package:atrak/blocs/atrak_bloc.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/action_item.dart';
import 'package:atrak/widgets/block_provider.dart';
import 'package:atrak/widgets/item_leave_balance.dart';
import 'package:atrak/widgets/navigation_drawer.dart';
import 'package:atrak/widgets/punching_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double leftPadding = 25.0;
  final double rightPadding = 25.0;

  final DateFormat _amOrPm = DateFormat("a");
  final DateFormat _hourAndMin = DateFormat("hh:mm");
  final DateFormat _dateFormat = DateFormat("EEEE d, MMM y");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AtrakBloc _bloc = BlocProvider.of<AtrakBloc>(context);

    Future<String> getLocation(double latitude, double longitude) async {
      // From coordinates
      final coordinates = new Coordinates(latitude, longitude);
      var addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      return first.addressLine;
    }

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            AtrakTheme.gradientStartColor,
            AtrakTheme.gradientEndColor
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: StreamBuilder<String>(
              stream: _bloc.coordinates,
              initialData: "",
              builder: (context, coordinatesSnapShot) {
                return Text(
                  coordinatesSnapShot.hasData
                      ? coordinatesSnapShot.data
                      : "Good Morning",
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.display2.copyWith(
                      fontSize: 20.0,
                      color: AtrakTheme.iconColor,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                );
              }),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        drawer: NavigationDrawer(_bloc.employee),
        body: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              StreamBuilder<DateTime>(
                stream: _bloc.currentTime,
                initialData: DateTime.now(),
                builder: (context, timerSnapShot) => Column(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: _hourAndMin.format(timerSnapShot.hasData
                                  ? timerSnapShot.data
                                  : DateTime.now()),
                              style: Theme.of(context)
                                  .textTheme
                                  .display3
                                  .copyWith(
                                      fontSize: 50,
                                      color: AtrakTheme.iconColor),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " ${_amOrPm.format(timerSnapShot.hasData
                                      ? timerSnapShot.data
                                      : DateTime.now())}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display3
                                      .copyWith(
                                        fontSize: 25.0,
                                        color: AtrakTheme.iconColor,
                                      ),
                                )
                              ]),
                        ),
                        Text(
                          _dateFormat.format(timerSnapShot.hasData
                              ? timerSnapShot.data
                              : DateTime.now()),
                          style: Theme.of(context).textTheme.display2.copyWith(
                              fontSize: 20.0,
                              color: AtrakTheme.iconColor,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                  child: Container(
                color: AtrakTheme.backgroundColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 45.0,
                      padding: EdgeInsets.only(left: leftPadding + 6.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Leave balance",
                        style: Theme.of(context).textTheme.display3.copyWith(
                            fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            SizedBox(
                              width: leftPadding,
                            ),
                            ItemLeaveBalance(
                              leaveType: "Casual Leave",
                              balanceLeave: 3,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ItemLeaveBalance(
                              leaveType: "Sick Leave",
                              balanceLeave: 2,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            ItemLeaveBalance(
                              leaveType: "Paid Leave",
                              balanceLeave: 5,
                            ),
                            SizedBox(
                              width: rightPadding,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 22.0, bottom: 22.0),
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: <Widget>[
                              SizedBox(
                                width: 20.0,
                              ),
                              ActionItem(action: "Leaves"),
                              SizedBox(width: 13.0),
                              ActionItem(action: "Permissions"),
                              SizedBox(width: 13.0),
                              ActionItem(action: "On Duty")
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 4,
                        child: PunchingDashboard(
                          userStream: _bloc.user,
                          updateUser: _bloc.updateUser,
                        ))
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

/*

Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                                _hourAndMin.format(timerSnapShot.hasData
                                    ? timerSnapShot.data
                                    : DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .display3
                                    .copyWith(
                                      fontSize: 50.0,
                                      color: AtrakTheme.iconColor,
                                    )),
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0, left: 5.0),
                              child: Text(
                                _amOrPm.format(timerSnapShot.hasData
                                    ? timerSnapShot.data
                                    : DateTime.now()),
                                style: Theme.of(context)
                                    .textTheme
                                    .display3
                                    .copyWith(
                                      fontSize: 25.0,
                                      color: AtrakTheme.iconColor,
                                    ),
                              ),
                            ),
                          ],
                        ),


 */
