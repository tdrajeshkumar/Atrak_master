import 'package:atrak/theme.dart';
import 'package:atrak/widgets/on_duty_request.dart';
import 'package:atrak/widgets/on_duty_status.dart';
import 'package:flutter/material.dart';

class OnDutyScreen extends StatefulWidget {
  @override
  _OnDutyScreenState createState() => _OnDutyScreenState();
}

class _OnDutyScreenState extends State<OnDutyScreen> {
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
            "OD",
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
            labelStyle:
                Theme.of(context).textTheme.display1.copyWith(fontSize: 16),
            labelColor: AtrakTheme.darkDisplayColor,
            indicatorWeight: 3.0,
            indicatorColor: AtrakTheme.textIndicatorColor,
            tabs: [
              Tab(
                text: "OD Request",
              ),
              Tab(text: "Request Status"),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          OnDutyRequest(title: "Ask for OD"),
          OnDutyStatus(title: "Request Status")
        ]),
      ),
    );
  }
}
