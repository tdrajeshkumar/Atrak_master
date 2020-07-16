import 'package:atrak/blocs/models/user.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/generic_widget/spinner_text.dart';
import 'package:atrak/widgets/punch_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PunchingDashboard extends StatefulWidget {
  final void Function(User) updateUser;
  final Stream<User> userStream;

  PunchingDashboard({Key key, this.updateUser, this.userStream})
      : super(key: key);

  @override
  _PunchingDashboardState createState() => _PunchingDashboardState();
}

class _PunchingDashboardState extends State<PunchingDashboard> {
  static const paddingLeft = 25.0;
  static const paddingRight = 25.0;

  DateFormat _hourAndMin = DateFormat("hh:mm");
  DateFormat _dateFormat = DateFormat("MMM d, y");

  _PunchingDashboardState();

  User _user;
  CurrentState _state;

  @override
  void initState() {
    super.initState();
  }

  _initUser(User user) {
    _user = user;
    _state = user == null
        ? user.lastCheckOut.isAfter(user.lastCheckIn)
            ? CurrentState.checkedIn
            : CurrentState.checkedOut
        : CurrentState.checkedOut;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: widget.userStream,
      builder: (context, userSnapShot) {
        if (userSnapShot.hasData) {
          print("Initializing User");
          _initUser(userSnapShot.data);
        }
        return Padding(
          padding:
              const EdgeInsets.only(left: paddingLeft, right: paddingRight),
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            topLeft: Radius.circular(10.0)),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                "Last Checkin",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: AtrakTheme.greyTextColor),
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            SpinnerText(
                                text: userSnapShot?.data != null
                                    ? userSnapShot.data.lastCheckIn != null
                                        ? _hourAndMin.format(
                                            userSnapShot?.data?.lastCheckIn)
                                        : '--:--'
                                    : '--:--',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 33,
                                        color: AtrakTheme.greyTextColor)),
                            SpinnerText(
                                text: userSnapShot.data?.lastCheckIn != null
                                    ? _dateFormat
                                        .format(userSnapShot.data?.lastCheckIn)
                                    : '',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 18,
                                        color: AtrakTheme.greyTextColor))
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 5.0),
                          child: Container(
                              color: AtrakTheme.dividerColor, width: 1.0),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Last Checkout",
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AtrakTheme.greyTextColor),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            SpinnerText(
                                text: userSnapShot.data?.lastCheckOut != null
                                    ? userSnapShot.data.lastCheckOut != null
                                        ? _hourAndMin.format(
                                            userSnapShot.data.lastCheckOut)
                                        : '--:--'
                                    : '--:--',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                        fontSize: 33,
                                        color: AtrakTheme.greyTextColor)),
                            SpinnerText(
                                text: userSnapShot.data?.lastCheckOut != null
                                    ? _dateFormat
                                        .format(userSnapShot.data.lastCheckOut)
                                    : '',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(
                                    fontSize: 18,
                                    color: AtrakTheme.greyTextColor))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 0.0, bottom: 10.0),
                      color: Colors.white,
                      child: PunchSlider(
                        currentState: _state,
                        stateChanged: (state) {
                          if (state == CurrentState.checkedIn) {
                            print(userSnapShot.data.toString());
                            widget.updateUser(
                                _user.copyWith(lastCheckedIn: DateTime.now()));
                          } else {
                            print(_user.toString());
                            widget.updateUser(
                                _user.copyWith(lastCheckedOut: DateTime.now()));
                          }
                        },
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
