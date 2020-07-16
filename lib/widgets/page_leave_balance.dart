import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_leave_balance.dart';
import 'package:flutter/material.dart';

class PageLeaveBalance extends StatefulWidget {
  @override
  _PageLeaveBalanceState createState() => new _PageLeaveBalanceState();
}

class _PageLeaveBalanceState extends State<PageLeaveBalance> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AtrakTheme.backgroundColor,
      child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(20.0),
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 10.0,
          children: <Widget>[
            GridTile(
              child: ItemLeaveBalance(
                leaveType: "Casual Leave",
                balanceLeave: 3,
              ),
            ),
            GridTile(
              child: ItemLeaveBalance(
                leaveType: "Sick Leave",
                balanceLeave: 2,
              ),
            ),
            GridTile(
              child: ItemLeaveBalance(
                leaveType: "Paid Leave",
                balanceLeave: 5,
              ),
            ),
            GridTile(
              child: ItemLeaveBalance(
                leaveType: "Vacation Leave",
                balanceLeave: 5,
              ),
            )
          ],
      ),
    );
  }
}
