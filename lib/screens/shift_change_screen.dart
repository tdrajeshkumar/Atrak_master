import 'package:atrak/theme.dart';
import 'package:atrak/widgets/page_requests_status.dart';
import 'package:atrak/widgets/page_requests.dart';
import 'package:flutter/material.dart';

class ShiftChangeScreen extends StatefulWidget {
  @override
  _ShiftChangeScreenState createState() => _ShiftChangeScreenState();
}

class _ShiftChangeScreenState extends State<ShiftChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Shift Change",
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
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: TabBar(

            labelColor: AtrakTheme.darkDisplayColor,
            indicatorWeight: 3.0,
            indicatorColor: AtrakTheme.gradientEndColor,
            tabs: <Widget>[
              Tab(
                text: 'Shift request',
              ),
              Tab(
                text: 'Request Status',
              ),
            ],
          ),
        ),

        body: TabBarView(children: <Widget>[
          PageRequests(title: "Shift change application",),
          PageRequestsStatus(title: "Shift Change status",),
        ]),
      ),
    );
  }
}
