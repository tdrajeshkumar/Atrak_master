import 'package:atrak/theme.dart';
import 'package:atrak/widgets/page_leave_balance.dart';
import 'package:atrak/widgets/page_requests.dart';
import 'package:atrak/widgets/page_requests_status.dart';
import 'package:flutter/material.dart';

class LeavesScreen extends StatefulWidget {

  @override
  _LeavesScreenState createState() => _LeavesScreenState();
}

class _LeavesScreenState extends State<LeavesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Leaves",
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
          ),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.display1.copyWith(fontSize: 16),
            labelColor: AtrakTheme.darkDisplayColor,
            indicatorWeight: 3.0,
            indicatorColor: AtrakTheme.textIndicatorColor,
            tabs: [
              Tab(text: "Balance",),
              Tab(text: "Request"),
              Tab(text: "Status"),
            ],
          ),
        ),

        body: TabBarView(children: <Widget>[
          PageLeaveBalance(),
          PageRequests(title: "Leave application",),
          PageRequestsStatus(title: "Leave status",)
        ]),
      ),
    );
  }
}
