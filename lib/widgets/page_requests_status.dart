import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_status.dart';
import 'package:flutter/material.dart';

class PageRequestsStatus extends StatelessWidget {
  final double leftPadding = 25.0;
  final String title;

  const PageRequestsStatus({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String item1 = title == 'Leave status' ? 'Sick Leave' :  "Shift change";
    String item2 = title == 'Leave status' ? 'Casual Leave' :  "Shift change";
    String item3 = title == 'Leave status' ? 'Casual Leave' :  "Shift change";
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
            padding: EdgeInsets.only(left: leftPadding),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .display3
                  .copyWith(fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
              textAlign: TextAlign.center,
            ),
          ),
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 10.0),
            children: <Widget>[
              ItemStatus(
                  type: item1,
                  status: "Pending",
                  totalDays: 2,
                  dateInString: "Nov 30 - Dec 1 2018"),
              SizedBox(
                height: 10.0,
              ),
              ItemStatus(
                  type: item2,
                  status: "Approved",
                  totalDays: 2,
                  dateInString: "Nov 30 - Dec 1 2018"),
              SizedBox(
                height: 10.0,
              ),
              ItemStatus(
                  type: item3,
                  status: "Cancelled",
                  totalDays: 2,
                  dateInString: "Nov 30 - Dec 1 2018"),
            ],
          ),
        ],
      ),
    );
  }
}
