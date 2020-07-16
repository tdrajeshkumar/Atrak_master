import 'package:atrak/theme.dart';
import 'package:atrak/widgets/comp_off_request.dart';
import 'package:atrak/widgets/comp_off_status.dart';
import 'package:flutter/material.dart';

class CompOffScreen extends StatefulWidget {
  @override
  _CompOffScreenState createState() => _CompOffScreenState();
}

class _CompOffScreenState extends State<CompOffScreen> {
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
            "Comp-off",
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
                text: "Comp-off Request",
              ),
              Tab(text: "Request Status"),
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CompOffRequest(title: "Ask for Comp-off",),
          CompOffStatus(title: "Request Status")
        ]),
      ),
    );
  }
}
