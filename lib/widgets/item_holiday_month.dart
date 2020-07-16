import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemHolidayMonth extends StatelessWidget {
  final String month;

  const ItemHolidayMonth({Key key, this.month}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            month,
            style: TextStyle(
              color: AtrakTheme.greyTextColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          Divider(
            color: AtrakTheme.dividerColor,
          ),
        ],
      ),
    );
  }
}
