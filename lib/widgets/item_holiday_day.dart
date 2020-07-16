import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemHolidayDay extends StatelessWidget {
  final String name, day;

  const ItemHolidayDay({Key key, this.name, this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: TextStyle(color: AtrakTheme.darkDisplayColor, fontSize: 18.0),
          ),
          Text(
            day,
            style: TextStyle(color: AtrakTheme.darkDisplayColor, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
