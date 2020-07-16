import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_team_lead_status.dart';
import 'package:flutter/material.dart';

class PermissionRequestStatus extends StatefulWidget {
  final double leftPadding = 25.0;
  final String title;

  const PermissionRequestStatus({Key key, @required this.title})
      : super(key: key);

  @override
  _PermissionRequestStatusState createState() =>
      _PermissionRequestStatusState();
}

class _PermissionRequestStatusState extends State<PermissionRequestStatus> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AtrakTheme.backgroundColor,
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 45.0,
                padding: EdgeInsets.only(left: widget.leftPadding),
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.display3.copyWith(
                      fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                  child: ListView(
                      shrinkWrap: true,
                      padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
                      children: <Widget>[
                    ItemTeamLeadStatus(
                        type: "Permission",
                        status: "Pending",
                        totalHours: "03",
                        dateInString: "Nov 18 2018",
                        timeInString: "10:00 AM - 01:00 PM",
                        isCompOff: false),
                    SizedBox(
                      height: 10.0,
                    ),
                    ItemTeamLeadStatus(
                        type: "Permission",
                        status: "Approved",
                        totalHours: "03",
                        dateInString: "Nov 10 2018",
                        timeInString: "10:00 AM - 01:00 PM",
                        isCompOff: false),
                    SizedBox(
                      height: 10.0,
                    ),
                    ItemTeamLeadStatus(
                        type: "Permission",
                        status: "Cancelled",
                        totalHours: "03",
                        dateInString: "Nov 09 2018",
                        timeInString: "10:00 AM - 01:00 PM",
                        isCompOff: false)
                  ]))
            ]));
  }
}
