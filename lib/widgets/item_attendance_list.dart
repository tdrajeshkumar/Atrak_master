import 'package:atrak/theme.dart';
import 'package:flutter/material.dart';

class ItemAttendanceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Table(
        children: [
          TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.fill,
                child: Container(
                  constraints: BoxConstraints(maxWidth: 10.0),
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4.0),
                      bottomLeft: Radius.circular(4.0),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        AtrakTheme.gradientStartColor,
                        AtrakTheme.gradientEndColor,
                      ],
                      begin: Alignment(1.0, -1.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        '14',
                        style: TextStyle(fontSize: 28.0, color: Colors.white),
                      ),
                      Text(
                        'Nov',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'In time',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.body1.fontSize,
                          color: AtrakTheme.greyTextColor,),
                      ),
                      Text('09:00 AM',
                          style: TextStyle(
                              fontSize:
                                  Theme.of(context).textTheme.body1.fontSize,
                              color: AtrakTheme.darkDisplayColor)),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Out time',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.body1.fontSize,
                          color: AtrakTheme.greyTextColor,
                        ),
                      ),
                      Text('Still checked in',
                          style: TextStyle(
                              fontSize:
                                  Theme.of(context).textTheme.body1.fontSize,
                              color: AtrakTheme.darkDisplayColor,)),
                    ],
                  ),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Duration',
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.body1.fontSize,
                          color: AtrakTheme.greyTextColor,
                          fontFamily: 'Work Sans',
                        ),
                      ),
                      Text('6 hrs & counting',
                          style: TextStyle(
                              fontSize:
                                  Theme.of(context).textTheme.body1.fontSize,
                              color: AtrakTheme.darkDisplayColor,
                              fontFamily: 'Work Sans')),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
