import 'package:atrak/theme.dart';
import 'package:atrak/widgets/page_team_leaves_active_request.dart';
import 'package:atrak/widgets/page_team_leaves_past_request.dart';
import 'package:flutter/material.dart';

class TeamLeavesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text(
            'Leaves',
            style: TextStyle(
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w600,
                color: AtrakTheme.greyTextColor),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelStyle:
                Theme.of(context).textTheme.display1.copyWith(fontSize: 16),
            labelColor: AtrakTheme.darkDisplayColor,
            indicatorWeight: 3.0,
            indicatorColor: AtrakTheme.textIndicatorColor,
            tabs: <Widget>[
              Tab(
                text: 'Active requests',
              ),
              Tab(
                text: 'Past requests',
              ),
            ],
          ),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: AtrakTheme.gradientStartColor,
            ),
            onPressed: () {
              print('hi');
            Navigator.pop(context);
            },
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            PageTeamLeavesActiveRequest(),
            PageTeamLeavesPastRequest(),
          ],
        ),
      ),
    );
  }
}
