import 'package:atrak/theme.dart';
import 'package:atrak/widgets/permission_request.dart';
import 'package:atrak/widgets/permission_request_status.dart';
import 'package:flutter/material.dart';

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
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
            "Permissions",
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
              FittedBox(
                child: Tab(
                  text: "Permission Request",
                ),
              ),
              FittedBox(child: Tab(text: "Request Status")),
            ],
          ),
        ),
        body: TabBarView(
            children: <Widget>[
              PermissionRequest(title: "Ask for permissions"), 
              PermissionRequestStatus(title: "Request Status")
            ]),
      ),
    );
  }
}
